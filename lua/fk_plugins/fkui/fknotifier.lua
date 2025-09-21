
local M = {}

function M.setup()
  local notify = require("notify")

  notify.setup({
    background_colour = "#000000",
    stages = "fade_in_slide_out",
    timeout = 3000,
    render = "default",
    fps = 60,
    max_width = 60,
    icons = {
      ERROR = "",
      WARN  = "",
      INFO  = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })

  vim.notify = notify
end

return M

