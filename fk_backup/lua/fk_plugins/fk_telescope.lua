local M = {}

function M.setup()
  local actions = require("telescope.actions")
  require("telescope").setup({
    defaults = {
      prompt_prefix = " 🔎  ",
      selection_caret = " ",
      path_display = { "smart" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          preview_width = 0.6,
          prompt_position = "top",
        },
        width = 0.90,
        height = 0.90,
        preview_cutoff = 120,
      },
      mappings = {
        i = {
          ["<Esc>"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        previewer = true,
      },
      live_grep = {
        previewer = true,
      },
      buffers = {
        previewer = true,
      },
      help_tags = {
        previewer = true,
      },
      oldfiles = {
        previewer = true,
        theme = "dropdown", -- or "ivy"
      },
    },
  })
end

return M

