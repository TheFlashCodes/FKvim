local M = {}

function M.setup()
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
          function()
            return require("nvim-treesitter.parsers").has_parser() and "🌳 TS" or "✗"
          end,
          color = { fg = "#a6e3a1", gui = "bold" }, -- optional: green color
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

