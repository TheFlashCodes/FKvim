
-- lua/fk_configs/fk_neotree.lua
local M = {}

function M.setup()
  require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    enable_diagnostics_follow_cursor = true,

    window = {
      position = "left",
      width = 30,
      win_config = {
        title = "🗂️ Fkvim Explorer",
        title_pos = "center",
      },
      mappings = {
        ["/"] = function()
          require("telescope.builtin").live_grep({
            cwd = require("neo-tree.utils").get_cwd()
          })
        end,
        ["+"] = "add", -- Create new file
        ["a"] = { "add", config = { show_path = "relative" } }, -- Also bind `a`
      },
    },

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },

    buffers = {
      follow_current_file = { enabled = true },
    },

    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "➜",
          untracked = "★",
          ignored = "◌",
        },
      },
      diagnostics = {
        symbols = {
          hint = "󰌵 ",
          info = " ",
          warn = " ",
          error = " ",
        },
        highlights = {
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          warn = "DiagnosticSignWarn",
          error = "DiagnosticSignError",
        },
      },
    },
  })
end

return M
