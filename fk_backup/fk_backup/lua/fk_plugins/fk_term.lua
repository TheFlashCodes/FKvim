-- lua/fk_configs/fk_toggleterm.lua
local M = {}

function M.setup()
  require("toggleterm").setup({
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false, -- 🚫 No background shading
    direction = "horizontal",
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    close_on_exit = true,
    shell = vim.o.shell,
    highlights = {
      Normal = {
        guibg = "NONE", -- ✅ Transparent background
      },
      NormalFloat = {
        guibg = "NONE", -- ✅ Transparent floating terminal
      },
      FloatBorder = {
        guifg = "#a6e3a1", -- Optional: Catppuccin green
        guibg = "NONE",    -- ✅ Transparent border
      },
    },
  })
end

return M

