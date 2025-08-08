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
            return "🛠️ " .. (vim.g.fk_kit or "Base")
          end,
          color = { fg = "f9e2af", gui = "bold" },
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

lualine_x = {
  {
    function()
      if vim.bo.filetype:match("neo%-tree") then
        return "🗂️ FKvim Explorer"
      elseif vim.api.nvim_buf_get_name(0):match("FkAI Gemini") then
        return "🖥️ FkAI Gemini"
      end

      local lang = vim.bo.filetype ~= "" and vim.bo.filetype or "NoLang"
      return "🧠 FKvim | " .. lang
    end,
    color = function()
      if vim.bo.filetype:match("neo%-tree") then
        return { fg = "#f9e2af", gui = "bold" }
      elseif vim.api.nvim_buf_get_name(0):match("FkAI Gemini") then
        return { fg = "#89b4fa", gui = "bold" } -- Using the same color as other FKvim items
      end
      return { fg = "#89b4fa", gui = "bold" }
    end,
  },
},


      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })
end

return M
