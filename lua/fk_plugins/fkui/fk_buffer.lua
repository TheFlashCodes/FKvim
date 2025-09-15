
local M = {}

function M.setup()
  vim.opt.termguicolors = true
  vim.o.mouse = "a" -- ✅ Enable mouse interaction

  local cp = require("catppuccin.palettes").get_palette("mocha")

  require("bufferline").setup({
    options = {
      mode = "buffers",
      themable = true,
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      show_close_icon = false,
      show_buffer_close_icons = true, -- Needed for hover to work
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local icons = {
          error = " ",
          warning = " ",
          info = " ",
          hint = "󰌵 ",
        }
        local result = ""
        for type, icon in pairs(icons) do
          local n = diagnostics_dict[type]
          if n and n > 0 then
            result = result .. icon .. n .. " "
          end
        end
        return result
      end,
      separator_style = "slant",
      sort_by = "insert_after_current",
      persist_buffer_sort = true,
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "📌" }),
        },
      },
      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "🗂️ Fkvim Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "terminal",
          text = " FkAI Gemini",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },
    },

    highlights = require("catppuccin.groups.integrations.bufferline").get_theme({
      styles = { "bold" },
      custom = {
        all = {
          fill = { bg = "none" },
          background = { bg = "none" },
          separator = { fg = cp.surface0, bg = "none" },
          separator_selected = { fg = cp.yellow, bg = "none" },
        },
        buffer_selected = {
          fg = cp.yellow,
          bg = "none",
          bold = true,
          italic = false,
          underline = true,
          sp = cp.yellow,
        },
        close_button_visible = { fg = cp.subtext0, bg = "none" },
        close_button_selected = { fg = cp.red, bg = "none" },
      },
    }),
  })
end

return M
