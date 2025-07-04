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
      show_close_icon = false,
      show_buffer_close_icons = true,  -- ✅ Must be true for hover to work
      diagnostics = "nvim_lsp",
      separator_style = "slant",
      sort_by = 'insert_after_current', -- or 'insert_at_end'
      persist_buffer_sort = true,

        -- Add these for pin support
      groups = {
        items = {
           require("bufferline.groups").builtin.pinned:with({ icon = "📌" }),
        },
      },
      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" }, -- Only reveal close icon on hover
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "🗂️ Fkvim Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },
    },

    highlights = require("catppuccin.groups.integrations.bufferline").get({
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
          gui = "bold,underline",
          sp = cp.yellow,
        },
      },
    }),
  })
end

return M

