
-- lua/fk_plugins/fkcore/fkInstaller.lua

local NuiPopup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local M = {}

function M.open()
  vim.notify("🛠️ FKvim Installer UI launching...", vim.log.levels.INFO, {
    title = "FKvim Installer",
    timeout = 1500,
  })

  -- Get editor dimensions
  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.4)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Popup UI
  local popup = NuiPopup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " 🚀 FKvim Toolkit Installer ",
        top_align = "center",
      },
    },
    position = {
      row = row,
      col = col,
    },
    size = {
      width = width,
      height = height,
    },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  })

  popup:mount()

  -- Define content
  local content = {
    "Choose a Toolkit to Install:",
    "",
    "  1. 🌐 FKvim Web Dev Kit (WDK)",
    "  2. 🐍 FKvim Python Dev Kit (PDK)",
    "  3. ☕ FKvim Java Dev Kit (JDK)",
    "",
    "  Press the corresponding number to install",
    "  or 'q' to quit.",
    "",
    "  📦 Each kit will install from its respective branch.",
  }

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, content)

  -- Key mappings
  local install_toolkit = function(name, branch)
    popup:unmount()
    vim.notify("🔧 Installing " .. name .. "...", vim.log.levels.INFO, {
      title = "FKvim Installer",
    })
    -- Add actual install logic here (e.g., checkout branch, sync plugins)
    vim.cmd("echo 'TODO: Checkout branch `" .. branch .. "` and sync plugins'")
  end

  vim.keymap.set("n", "1", function() install_toolkit("Web Dev Kit", "fkvim-wdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "2", function() install_toolkit("Python Dev Kit", "fkvim-pdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "3", function() install_toolkit("Java Dev Kit", "fkvim-jdk") end, { buffer = popup.bufnr })
  vim.keymap.set("n", "q", function() popup:unmount() end, { buffer = popup.bufnr })

  -- Auto-close when buffer is left
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)
end

return M
