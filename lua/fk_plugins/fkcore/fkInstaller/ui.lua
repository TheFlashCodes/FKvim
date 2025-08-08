
local NuiPopup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local Path = require("plenary.path")
local Job = require("plenary.job")

local M = {}

-- 🌈 Highlighted lines
local function colored_line(bufnr, line_num, content, hl_group)
  vim.api.nvim_buf_set_lines(bufnr, line_num, line_num + 1, false, { content })
  vim.api.nvim_buf_add_highlight(bufnr, -1, hl_group, line_num, 0, -1)
end

-- ⏳ Simulated Progress Bar
local function run_progress(toolkit_name)
  local popup = NuiPopup({
    border = {
      style = "rounded",
      text = { top = "🔧 Installing " .. toolkit_name, top_align = "center" },
    },
    position = "50%",
    size = { width = 50, height = 6 },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  })

  popup:mount()

  local stages = {
    "  [██                                      ] 5%",
    "  [█████                                   ] 20%",
    "  [███████████                             ] 30%",
    "  [██████████████████████                  ] 50%",
    "  [████████████████████████████            ] 70%",
    "  [██████████████████████████████████      ] 90%",
    "  [████████████████████████████████████████] 100%",
  }

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {
    "📡 Cloning from GitHub...",
    "",
    "[                                 ] 0%",
  })

  local i = 1
  local timer = vim.loop.new_timer()
  timer:start(300, 400, vim.schedule_wrap(function()
    if i <= #stages then
      vim.api.nvim_buf_set_lines(popup.bufnr, 2, 3, false, { stages[i] })
      i = i + 1
    else
      timer:stop()
      timer:close()
      vim.defer_fn(function()
        popup:unmount()
        vim.g.fk_kit = toolkit_name
        vim.notify("✅ " .. toolkit_name .. " Installed!", vim.log.levels.INFO, { title = "FKvim Installer" })
      end, 800)
    end
  end))
end

-- 📦 Backup current config

-- 📦 Backup current config
local function backup_current_config()
  local nvim_config = vim.fn.stdpath("config")                         -- ~/.config/nvim
  local backup_dir = vim.fn.stdpath("config"):gsub("/nvim$", "/fkvim/backup")  -- ~/.config/fkvim/backup

  vim.fn.mkdir(backup_dir, "p")                                        -- ensure backup folder exists
  vim.fn.system("cp -r " .. nvim_config .. "/* " .. backup_dir)

  vim.notify("📦 Your config has been backed up to ~/.config/fkvim/backup", vim.log.levels.INFO)
end

-- 🧠 Switch FKvim Kit

local function switch_to_kit(branch)
  local config_dir = vim.fn.stdpath("config")
  backup_current_config()

  Job:new({
    command = "git",
    args = { "-C", config_dir, "fetch", "origin" },
    on_exit = function()
      Job:new({
        command = "git",
        args = { "-C", config_dir, "checkout", branch },
        on_exit = function(j, return_val)
          if return_val == 0 then
            vim.schedule(function()
              vim.notify("🔁 Switched to branch: " .. branch, vim.log.levels.INFO)
              vim.cmd("source $MYVIMRC")
            end)
          else
            vim.schedule(function()
              vim.notify("❌ Failed to checkout " .. branch, vim.log.levels.ERROR)
            end)
          end
        end,
      }):start()
    end,
  }):start()
end

-- ✅ Confirm install
local function confirm_install(popup, toolkit_name, branch)
  local handle = io.popen("git ls-remote --heads origin " .. branch)
  local result = handle:read("*a")
  handle:close()

  if result == "" then
    vim.notify("🚧 We are currently working on the " .. toolkit_name .. ".\nPlease try again later.", vim.log.levels.WARN, {
      title = "FKvim Installer",
    })
    return
  end

  local choice = vim.fn.confirm(
    "⚠️ Switching to '" .. toolkit_name .. "' may overwrite your custom FKvim config.\n\nContinue?",
    "&Yes\n&No",
    2
  )

  if choice == 1 then
    popup:unmount()
    run_progress(toolkit_name)
    switch_to_kit(branch)
  else
    vim.notify("🚫 Cancelled switching to " .. toolkit_name, vim.log.levels.WARN, { title = "FKvim Installer" })
  end
end

-- Check if a CLI tool is installed
local function is_tool_installed(executable)
  return vim.fn.executable(executable) == 1
end

-- ⚙️ Install or Upgrade CLI Tool
local function install_cli_tool(popup, tool_name, install_command, update_command, executable)
  if executable and is_tool_installed(executable) then
    local choice = vim.fn.confirm(
      tool_name .. " is already installed. Would you like to upgrade it?",
      "&Yes\n&No",
      2
    )
    if choice == 1 then
      popup:unmount()
      run_progress("Upgrading " .. tool_name)
      Job:new({
        command = "bash",
        args = {"-l", "-c", update_command},
        on_exit = function(j, return_val)
          if return_val == 0 then
            vim.schedule(function()
              vim.notify("✅ " .. tool_name .. " upgraded successfully!", vim.log.levels.INFO)
            end)
          else
            vim.schedule(function()
              vim.notify("❌ Failed to upgrade " .. tool_name, vim.log.levels.ERROR)
            end)
          end
        end,
      }):start()
    else
      vim.notify("🚫 Cancelled upgrade of " .. tool_name, vim.log.levels.WARN, { title = "FKvim Installer" })
    end
  else
    local choice = vim.fn.confirm(
      "Install " .. tool_name .. "?",
      "&Yes\n&No",
      2
    )

    if choice == 1 then
      popup:unmount()
      run_progress(tool_name)
      Job:new({
        command = "bash",
        args = {"-l", "-c", install_command},
        on_exit = function(j, return_val)
          if return_val == 0 then
            vim.schedule(function()
              vim.notify("✅ " .. tool_name .. " installed successfully!", vim.log.levels.INFO)
            end)
          else
            vim.schedule(function()
              vim.notify("❌ Failed to install " .. tool_name, vim.log.levels.ERROR)
            end)
          end
        end,
      }):start()
    else
      vim.notify("🚫 Cancelled installation of " .. tool_name, vim.log.levels.WARN, { title = "FKvim Installer" })
    end
  end
end

-- 🚀 FKvim Installer Main Popup
function M.open()
  local width = math.floor(vim.o.columns * 0.4)
  local height = 16
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local popup = NuiPopup({
    enter = true,
    border = {
      style = "rounded",
      text = { top = "🚀 FKvim Development Toolkit Installer", top_align = "center" },
    },
    position = { row = row, col = col },
    size = { width = width, height = height },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  })

  popup:mount()

  local gemini_install_command
  local gemini_update_command
  if vim.fn.has('mac') == 1 then
    gemini_install_command = "brew install gemini-cli"
    gemini_update_command = "brew upgrade gemini-cli"
  else
    gemini_install_command = "bash -l -c 'npm install -g @google/gemini-cli'"
    gemini_update_command = "bash -l -c 'npm update -g @google/gemini-cli'"
  end

  local toolkits = {
    { key = "1", name = "Web Dev Kit",     branch = "fkvim-wdk",     label = "🌐 FKvim Web Dev Kit (WDK)",    hl = "String" },
    { key = "2", name = "Python Dev Kit",  branch = "fkvim-pdk",     label = "🐍 FKvim Python Dev Kit (PDK)", hl = "Function" },
    { key = "3", name = "Java Dev Kit",    branch = "fkvim-jdk",     label = "☕ FKvim Java Dev Kit (JDK)",   hl = "Constant" },
    { key = "4", name = "Android Dev Kit", branch = "fkvim-android", label = "🤖 FKvim Android Dev Kit",      hl = "Type" },
    { key = "5", name = "iOS Dev Kit",     branch = "fkvim-ios",     label = "🍎 FKvim iOS Dev Kit",          hl = "Include" },
    { key = "6", name = "C/C++ Dev Kit",   branch = "fkvim-cpp",     label = "💻 FKvim C/C++ Dev Kit",         hl = "PreProc" },
    { key = "7", name = "Rust Dev Kit",    branch = "fkvim-rust",    label = "🦀 FKvim Rust Dev Kit",          hl = "Special" },
    { key = "8", name = "Go Dev Kit",      branch = "fkvim-go",      label = "🐹 FKvim Go Dev Kit",            hl = "Identifier" },
    { key = "9", name = "Gemini CLI",      command = gemini_install_command, update_command = gemini_update_command, executable = "gemini", label = "✨ Gemini CLI", hl = "Title" },
  }

  colored_line(popup.bufnr, 0, "💡 Choose a Development Toolkit to Install:", "Title")
  vim.api.nvim_buf_set_lines(popup.bufnr, 1, 2, false, { "" })

  local line_to_toolkit = {}

  for i, tk in ipairs(toolkits) do
    local line_num = i + 1
    local line = string.format("  %s. %s", tk.key, tk.label)
    colored_line(popup.bufnr, line_num, line, tk.hl)
    line_to_toolkit[line_num] = tk

    -- Key + Mouse + Enter handlers
    if tk.branch then
      vim.keymap.set("n", tk.key, function() confirm_install(popup, tk.name, tk.branch) end, { buffer = popup.bufnr })
    elseif tk.command then
      vim.keymap.set("n", tk.key, function() install_cli_tool(popup, tk.name, tk.command, tk.update_command, tk.executable) end, { buffer = popup.bufnr })
    end
  end

  vim.keymap.set("n", "<CR>", function()
    local cur = vim.fn.line(".")
    if line_to_toolkit[cur] then
      local tk = line_to_toolkit[cur]
      if tk.branch then
        confirm_install(popup, tk.name, tk.branch)
      elseif tk.command then
        install_cli_tool(popup, tk.name, tk.command, tk.update_command, tk.executable)
      end
    end
  end, { buffer = popup.bufnr })

  vim.keymap.set("n", "<LeftMouse>", function()
    local cur = vim.fn.line(".")
    if line_to_toolkit[cur] then
      local tk = line_to_toolkit[cur]
      if tk.branch then
        confirm_install(popup, tk.name, tk.branch)
      elseif tk.command then
        install_cli_tool(popup, tk.name, tk.command, tk.update_command, tk.executable)
      end
    end
  end, { buffer = popup.bufnr })


  local footer = {
    "🎯 Press the corresponding number key to install",
    "🔁 You can switch kits anytime using :FkInstall",
    "❌ Press 'q' to close this installer",
    "💡 Each kit loads plugins from its own FKvim branch",
  }

  local hl_footer = { "Question", "Operator", "Comment", "DiagnosticInfo" }
  for i, line in ipairs(footer) do
    colored_line(popup.bufnr, #toolkits + i + 2, line, hl_footer[i])
  end

  vim.keymap.set("n", "q", function() popup:unmount() end, { buffer = popup.bufnr })
  popup:on(event.BufLeave, function() popup:unmount() end)
end

return M
