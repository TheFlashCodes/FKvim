
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
  local bar = "[                    ] 0%"
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
        vim.notify("✅ " .. toolkit_name .. " Installed!", vim.log.levels.INFO, { title = "FKvim" })
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
  local height = 15
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local popup = NuiPopup({
    enter = true,
    border = {
      style = "rounded",
      text = {
        top = "🚀 FKvim Toolkit Installer",
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



local lines = {
  "💡 Choose a Toolkit to Install:",
  "",
  "  1. 🌐 FKvim Web Dev Kit (WDK)",
  "  2. 🐍 FKvim Python Dev Kit (PDK)",
  "  3. ☕ FKvim Java Dev Kit (JDK)",
  "  4. 🤖 FKvim Android Dev Kit",
  "  5. 🍎 FKvim iOS Dev Kit",
  "  6. 💻 FKvim C/C++ Dev Kit",
  "  7. 🦀 FKvim Rust Dev Kit",
  "  8. 🐹 FKvim Go Dev Kit",
  "",
  "🎯 Press the corresponding number key to install",
  "🔁 You can switch kits anytime using :FkInstall",
  "❌ Press 'q' to close this installer",
  "💡 Each kit loads plugins from its own FKvim branch",
  }

    for i, line in ipairs(lines) do
  local hl = "Normal"

  if i == 1 then
    hl = "Title"
  elseif line:find("Web Dev Kit") then
    hl = "String"
  elseif line:find("Python Dev Kit") then
    hl = "Function"
  elseif line:find("Java Dev Kit") then
    hl = "Constant"
  elseif line:find("Android") then
    hl = "Type"
  elseif line:find("iOS") then
    hl = "Include"
  elseif line:find("C/C%+%+") then
    hl = "PreProc"
  elseif line:find("Rust") then
    hl = "Special"
  elseif line:find("Go Dev") then
    hl = "Identifier"
  elseif line:find("Press the corresponding") then
    hl = "Question"
  elseif line:find("You can switch") then
    hl = "Operator"
  elseif line:find("Press 'q'") then
    hl = "Comment"
  elseif line:find("Each kit loads") then
    hl = "DiagnosticInfo"
  end

  colored_line(popup.bufnr, i - 1, line, hl)
end


  -- Key mappings
  vim.keymap.set("n", "1", function() confirm_install(popup, "Web Dev Kit", "fkvim-wdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "2", function() confirm_install(popup, "Python Dev Kit", "fkvim-pdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "3", function() confirm_install(popup, "Java Dev Kit", "fkvim-jdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "q", function() popup:unmount() end, { buffer = popup.bufnr })
vim.keymap.set("n", "4", function() confirm_install(popup, "Android Dev Kit", "fkvim-android") end, { buffer = popup.bufnr })
vim.keymap.set("n", "5", function() confirm_install(popup, "iOS Dev Kit", "fkvim-ios") end, { buffer = popup.bufnr })
vim.keymap.set("n", "6", function() confirm_install(popup, "C/C++ Dev Kit", "fkvim-cpp") end, { buffer = popup.bufnr })
vim.keymap.set("n", "7", function() confirm_install(popup, "Rust Dev Kit", "fkvim-rust") end, { buffer = popup.bufnr })
vim.keymap.set("n", "8", function() confirm_install(popup, "Go Dev Kit", "fkvim-go") end, { buffer = popup.bufnr })

  popup:on(event.BufLeave, function() popup:unmount() end)
end

return M

