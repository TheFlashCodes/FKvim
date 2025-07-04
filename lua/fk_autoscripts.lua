vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
      vim.cmd("Neotree show")
    end
  end,
})

