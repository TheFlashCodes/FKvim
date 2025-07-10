
-- ~/lua/fk_plugins/core/fkInstaller/ui.lua

local NuiPopup = require("nui.popup")
local event = require("nui.utils.autocmd").event
local noice = require("noice")

local M = {}

-- 🌈 Color setup for lines
local function colored_line(bufnr, line_num, content, hl_group)
  vim.api.nvim_buf_set_lines(bufnr, line_num, line_num + 1, false, { content })
  vim.api.nvim_buf_add_highlight(bufnr, -1, hl_group, line_num, 0, -1)
end

-- ⏳ Simulated Progress Bar
local function run_progress(toolkit_name)
  local popup = NuiPopup({
    border = {
      style = "rounded",
      text = {
        top = "🔧 Installing " .. toolkit_name,
        top_align = "center",
      },
    },
    position = "50%",
    size = { width = 50, height = 6 },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        },
  })

popup:mount()

  local bar = "[                                 ] 0%"
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {
    "📡 Cloning from GitHub...",
    "",
    bar,
  })

  local stages = {
    "  [██                                      ] 5%",
    "  [█████                                   ] 20%",
    "  [███████████                             ] 30%",
    "  [██████████████████████                  ] 50%",
    "  [████████████████████████████            ] 70%",
    "  [██████████████████████████████████      ] 90%",
    "  [████████████████████████████████████████] 100%",
  }

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


-- Simple confirm fallback using built-in UI
local function confirm_install(popup, toolkit_name, branch)
  local choice = vim.fn.confirm(
    "⚠️ Switching to '" .. toolkit_name .. "' may overwrite your custom FKvim config.\n\nContinue?",
    "&Yes\n&No",
    2
  )

  if choice == 1 then
    popup:unmount()
    run_progress(toolkit_name)
    vim.g.fk_kit = toolkit_name
  else
    vim.notify("🚫 Cancelled switching to " .. toolkit_name, vim.log.levels.WARN, { title = "FKvim Installer" })
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
      text = {
        top = "🚀 FKvim Developemt Toolkit Installer",
        top_align = "center",
      },
    },
    position = { row = row, col = col },
    size = { width = width, height = height },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  })

  popup:mount()

  local toolkits = {
    { key = "1", name = "Web Dev Kit",     branch = "fkvim-wdk",    label = "🌐 FKvim Web Dev Kit (WDK)",    hl = "String" },
    { key = "2", name = "Python Dev Kit",  branch = "fkvim-pdk",    label = "🐍 FKvim Python Dev Kit (PDK)", hl = "Function" },
    { key = "3", name = "Java Dev Kit",    branch = "fkvim-jdk",    label = "☕ FKvim Java Dev Kit (JDK)",   hl = "Constant" },
    { key = "4", name = "Android Dev Kit", branch = "fkvim-android",label = "🤖 FKvim Android Dev Kit",     hl = "Type" },
    { key = "5", name = "iOS Dev Kit",     branch = "fkvim-ios",    label = "🍎 FKvim iOS Dev Kit",         hl = "Include" },
    { key = "6", name = "C/C++ Dev Kit",   branch = "fkvim-cpp",    label = "💻 FKvim C/C++ Dev Kit",        hl = "PreProc" },
    { key = "7", name = "Rust Dev Kit",    branch = "fkvim-rust",   label = "🦀 FKvim Rust Dev Kit",         hl = "Special" },
    { key = "8", name = "Go Dev Kit",      branch = "fkvim-go",     label = "🐹 FKvim Go Dev Kit",           hl = "Identifier" },
  }

  colored_line(popup.bufnr, 0, "💡 Choose a Developemt Toolkit to Install:", "Title")
  vim.api.nvim_buf_set_lines(popup.bufnr, 1, 2, false, { "" })

  -- Map of line numbers to toolkit
  local line_to_toolkit = {}

  for i, tk in ipairs(toolkits) do
    local line_num = i + 1
    local line = string.format("  %s. %s", tk.key, tk.label)
    colored_line(popup.bufnr, line_num, line, tk.hl)

    -- Store line number for enter/mouse mapping
    line_to_toolkit[line_num] = tk

    -- Key mapping
    vim.keymap.set("n", tk.key, function()
      confirm_install(popup, tk.name, tk.branch)
    end, { buffer = popup.bufnr })

    -- Mouse mapping
    vim.keymap.set("n", "<LeftMouse>", "", {
      callback = function()
        local cur_line = vim.fn.line(".")
        if line_to_toolkit[cur_line] then
          local tk = line_to_toolkit[cur_line]
          confirm_install(popup, tk.name, tk.branch)
        end
      end,
      buffer = popup.bufnr,
    })
  end

  -- Enter key functionality
  vim.keymap.set("n", "<CR>", function()
    local cur_line = vim.fn.line(".")
    local tk = line_to_toolkit[cur_line]
    if tk then
      confirm_install(popup, tk.name, tk.branch)
    end
  end, { buffer = popup.bufnr })

  -- Footer
  local start_line = #toolkits + 3
  local instructions = {
    "🎯 Press the corresponding number key to install",
    "🔁 You can switch kits anytime using :FkInstall",
    "❌ Press 'q' to close this installer",
    "💡 Each kit loads plugins from its own FKvim branch",
  }
  local hl_map = { "Question", "Operator", "Comment", "DiagnosticInfo" }

  for i, text in ipairs(instructions) do
    colored_line(popup.bufnr, start_line + i - 1, text, hl_map[i])
  end

  vim.keymap.set("n", "q", function() popup:unmount() end, { buffer = popup.bufnr })
  popup:on(event.BufLeave, function() popup:unmount() end)
end

return M
