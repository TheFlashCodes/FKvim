local M = {}
local popup = require("plenary.popup")

function M.show()
  local win_id, _ = popup.create({
    "🧩 Welcome to FKvim Installer",
    "",
    "Select a Dev Kit to install:",
    "",
    "1. Web Dev Kit (WDK)",
    "2. Python Dev Kit (PDK)",
    "3. Java Dev Kit (JDK)",
    "",
    "Press q to quit.",
  }, {
    title = "FKvim Development ToolKit Installer",
    highlight = "Normal",
    line = math.floor((vim.o.lines - 10) / 2),
    col = math.floor((vim.o.columns - 50) / 2),
    minwidth = 50,
    minheight = 10,
    border = true,
  })

  vim.api.nvim_buf_set_keymap(0, 'n', '1', ':lua require("fk_plugins.installer.git").install("fkvim-wdk")<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '2', ':lua require("fk_plugins.installer.git").install("fkvim-pdk")<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', '3', ':lua require("fk_plugins.installer.git").install("fkvim-jdk")<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end

return M


