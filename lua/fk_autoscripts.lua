
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local args = vim.fn.argv()
    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

    -- Open Dashboard and NeoTree only if opened with a folder (not specific files)
    if #args == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
      vim.schedule(function()
        vim.cmd("Dashboard")
        vim.cmd("Neotree show")
      end)
    elseif bufname == "" and filetype == "" then
      vim.schedule(function()
        vim.cmd("Dashboard")
      end)
    end
  end,
})

vim.o.mousemoveevent = true -- 🔥 Required for hover to work!

-- Smart winbar setup using a global function
_G.get_winbar = function()
  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok and navic.is_available() then
    return navic.get_location()
  end
  return ""
end

vim.o.winbar = "%{%v:lua.get_winbar()%}"
