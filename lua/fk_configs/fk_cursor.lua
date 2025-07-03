-- Define highlight group with Catppuccin pink
vim.api.nvim_set_hl(0, "CursorArrow", { fg = "#f5c2e7" })  -- Catppuccin Mocha Pink

-- Define the sign with ➤ arrow and highlight
vim.fn.sign_define("CursorArrow", {
  text = "",
  texthl = "CursorArrow",
  linehl = "",
  numhl = "",
})

-- Auto-place arrow on current cursor line
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.fn.sign_unplace("cursor_arrow", { buffer = bufnr })
    vim.fn.sign_place(0, "cursor_arrow", "CursorArrow", bufnr, {
      lnum = line,
      priority = 100,
    })
  end,
})

