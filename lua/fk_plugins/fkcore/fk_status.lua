
local M = {}

function M.setup()
  local navic = require("nvim-navic")

  require("lualine").setup({
    options = {
      theme = "catppuccin",
      icons_enabled = true,
      component_separators = "|",
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        { "filename", path = 1 },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          symbols = {
            error = " ",
            warn  = " ",
            info  = " ",
            hint  = "󰌵 ",
          },
          colored = true,
          update_in_insert = false,
          always_visible = false,
        },
        {
          function()
            return navic.is_available() and navic.get_location() or ""
          end,
          cond = function()
            return navic.is_available()
          end,
          color = { fg = "#f5c2e7", gui = "italic" },
        },
        {
          function()
            return require("nvim-treesitter.parsers").has_parser() and "🌳 TS" or "✗"
          end,
          color = { fg = "#a6e3a1", gui = "bold" },
          cond = function()
            return vim.bo.filetype ~= ""
          end,
        },
      },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

return M
