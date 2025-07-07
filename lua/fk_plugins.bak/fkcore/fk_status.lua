
local M = {}

function M.setup()
  -- local navic = require("nvim-navic") -- Commented out since wincrumb is disabled

  require("lualine").setup({
    options = {
      theme = "catppuccin",
      icons_enabled = true,
      component_separators = "|",
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },

      lualine_b = {
        {
          function()
            return ""
          end,
          cond = function()
            return vim.b.gitsigns_head ~= nil
          end,
          color = { fg = "#f9e2af" },
        },
        "branch",
        "diff",
      },

      lualine_c = {
        {
          function()
            local ft = vim.bo.filetype
            if ft:match("neo%-tree") then
              return "FK Explorer"
            end
            return vim.fn.expand("%:~:.")
          end,
          icon = "󰛓",
          color = { fg="#f9e2af", gui = "bold" },
        },

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

        -- Navic breadcrumb disabled
        -- {
        --   function()
        --     return navic.is_available() and navic.get_location() or ""
        --   end,
        --   cond = function()
        --     return navic.is_available() and vim.bo.filetype ~= "neo-tree"
        --   end,
        --   color = { fg = "#f5c2e7", gui = "italic" },
        -- },

        {
          function()
            return require("nvim-treesitter.parsers").has_parser() and "🌳 TS" or "✗"
          end,
          color = { fg = "#a6e3a1", gui = "bold" },
          cond = function()
            return vim.bo.filetype ~= "" and vim.bo.filetype ~= "neo-tree"
          end,
        },
      },

      -- Custom lualine_x section
      lualine_x = {
        {
          function()
            if vim.bo.filetype:match("neo%-tree") then
              return "🗂️ Fkvim"
            end
            return vim.bo.fileencoding
          end,
          color = function()
            if vim.bo.filetype:match("neo%-tree") then
              return { fg = "#f9e2af", gui = "bold" }
            end
            return {}
          end,
        },
        {
          function()
            if not vim.bo.filetype:match("neo%-tree") then
              return vim.bo.filetype
            end
            return ""
          end,
        },
      },

      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

return M
