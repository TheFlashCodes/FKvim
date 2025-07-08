
local M = {}

function M.run()
  local notify = require("notify")

  -- Step 1: "Starting FKvim..."
  notify("Starting FKvim...", "info", {
    title = "💻 FKvim Notifier",
    timeout = 1500,
    render = "default",
  })

  -- Step 2: "Loading all plugins..."
  vim.defer_fn(function()
    notify("Loading all plugins...", "info", {
      title = "🛠️ FKvim Notifier",
      timeout = 1500,
      render = "default",
    })
  end, 1200)

  -- Step 3: "FKvim Loaded" and final message
  vim.defer_fn(function()
    notify("✅ FKvim Loaded, Welcome", "info", {
      title = "🎉 FKvim Notifier",
      timeout = 2000,
      render = "default",
    })
    notify("Happy coding ⚡", "info", {
      title = "FKvim Notifier",
      timeout = 2500,
      render = "default",
    })
  end, 2500)
end

return M
