
-- lua/fk_plugins/fkui/fknotifier.lua

local M = {}

function M.setup()
  local notify = require("notify")

  -- Custom notify wrapper to filter messages
  local function filtered_notify(msg, level, opts)
    if msg:lower():match("swap file") or msg:match("E325") then
      return  -- skip swap file warnings
    end

    local titles = {
      [vim.log.levels.ERROR] = "FK Error",
      [vim.log.levels.WARN]  = "FK Warning",
      [vim.log.levels.INFO]  = "FK Info",
      [vim.log.levels.DEBUG] = "FK Debug",
      [vim.log.levels.TRACE] = "FK Trace",
    }

    opts = opts or {}
    opts.title = opts.title or titles[level] or "FK Notifier"
    notify(msg, level, opts)
  end

  notify.setup({
    background_colour = "#00000000",
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

  vim.notify = filtered_notify
end

return M

