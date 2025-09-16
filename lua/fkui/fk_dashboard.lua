
-- Dashboard Configuration
local db = require('dashboard')

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = false,
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      { desc = '󰒲 Last session', group = 'Label', action = 'lua require("persistence").load()', key = 'l' },
      { desc = ' dotfiles', group = 'Number', action = 'lua vim.cmd("Telescope find_files cwd=~/.config/nvim")', key = 'd' },
      { desc = ' home', group = 'Number', action = 'lua vim.cmd("Telescope find_files cwd=~/")', key = 'h' },
      { desc = ' Grep', group = 'Label', action = 'lua vim.cmd("Telescope live_grep")', key = 'a' },
      { desc = ' Buffers', group = 'Label', action = 'lua vim.cmd("Telescope buffers")', key = 'b' },
      { desc = ' Files', group = 'Label', action = 'lua vim.cmd("Telescope file_browser")', key = 'e' },
    }
  }
})
