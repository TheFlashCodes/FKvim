local M = {}

function M.setup()
  local api = vim.api

  -- ✅ Set green color (Catppuccin green)
  api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
    fg = "#a6e3a1", -- Green
    nocombine = true,
  })

  -- ✅ Setup mini.indentscope with animation
  require("mini.indentscope").setup({
    symbol = "│", -- You can use "┊" or "▏" if you prefer
    draw = {
      animation = require("mini.indentscope").gen_animation.quadratic({
        easing = "in-out",
        duration = 80,
        unit = "step",
      }),
    },
    options = {
      try_as_border = true,
    },
  })
end

return M

