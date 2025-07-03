local M = {}

function M.setup()
  -- ✅ Set custom highlight groups for green Catppuccin-like theme
  vim.api.nvim_set_hl(0, "IblIndent", { fg = "#a6e3a1", nocombine = true }) -- Soft Green
  vim.api.nvim_set_hl(0, "IblScope", { fg = "#94e2d5", nocombine = true }) -- Teal Green

  -- ✅ Setup indent-blankline (ibl.nvim)
  require("ibl").setup({
    indent = {
      char = "│",
      highlight = "IblIndent",
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      highlight = "IblScope",
      injected_languages = true,
      include = {
        node_type = {
          ["*"] = { "*" },
        },
      },
    },
    exclude = {
      filetypes = { "help", "dashboard", "lazy" }, -- Allow in NvimTree
      buftypes = { "terminal", "nofile" },
    },
  })
end

return M

