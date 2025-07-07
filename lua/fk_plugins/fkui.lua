-- Using the Theme 

vim.cmd.colorscheme("catppuccin")

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

