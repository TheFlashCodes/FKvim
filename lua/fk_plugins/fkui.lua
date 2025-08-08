-- Using the Theme 

vim.cmd.colorscheme("catppuccin")

-- Set transparent background for specific UI components
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "WhichKey", { bg = "none" })
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LazyNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "LazyFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpPmenuSel", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })

-- Turn off cursorline in normal mode, enable it in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = false
  end,
})
