vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Manual Catppuccin Mocha colors
    local colors = {
      red = "#F38BA8",
      green = "#A6E3A1",
      yellow = "#F9E2AF",
      blue = "#89B4FA",
      peach = "#FAB387",
      mauve = "#CBA6F7",
      sky = "#89DCEB",
      flamingo = "#F2CDCD",
    }

    -- Define highlight groups for dashboard keys
    vim.api.nvim_set_hl(0, "DashboardRed", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DashboardGreen", { fg = colors.green })
    vim.api.nvim_set_hl(0, "DashboardYellow", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "DashboardBlue", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "DashboardPeach", { fg = colors.peach })
    vim.api.nvim_set_hl(0, "DashboardMauve", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "DashboardSky", { fg = colors.sky })
    vim.api.nvim_set_hl(0, "DashboardFlamingo", { fg = colors.flamingo })
  end,
})

-- Define Catppuccin Mocha colors manually
local colors = {
  red = "#F38BA8",
  green = "#A6E3A1",
  yellow = "#F9E2AF",
  blue = "#89B4FA",
  peach = "#FAB387",
  mauve = "#CBA6F7",
  sky = "#89DCEB",
  flamingo = "#F2CDCD",
}

-- Set Dashboard highlight groups
vim.api.nvim_set_hl(0, "Red", { fg = colors.red })
vim.api.nvim_set_hl(0, "Green", { fg = colors.green })
vim.api.nvim_set_hl(0, "Yellow", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Blue", { fg = colors.blue })
vim.api.nvim_set_hl(0, "Peach", { fg = colors.peach })
vim.api.nvim_set_hl(0, "Mauve", { fg = colors.mauve })
vim.api.nvim_set_hl(0, "Sky", { fg = colors.sky })
vim.api.nvim_set_hl(0, "Flamingo", { fg = colors.flamingo })
