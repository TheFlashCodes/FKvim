-- Initializing FKui as default Buffer for FKvim

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if Neovim was opened with a folder
    if vim.fn.argc() == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
      -- Close the default buffer
      vim.cmd("enew")         -- New empty buffer
      vim.cmd("Dashboard")    -- Open FKvim Dashboard
    end
  end,
})

-- AutoLoading File Explorer

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
      vim.cmd("Neotree show")
    end
  end,
})

