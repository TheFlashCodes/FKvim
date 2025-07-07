-- lua/fk_plugins/fkui/fk_notify.lua
local M = {}

function M.setup()
  local notify = require("notify")

  notify.setup({
    background_colour = "#000000", -- or "Normal" if theme supports it
    fps = 60,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 2000,
    max_width = 60,
    icons = {
      ERROR = "",
      WARN  = "",
      INFO  = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })

  -- Override default notify
  vim.notify = notify
end

return M

