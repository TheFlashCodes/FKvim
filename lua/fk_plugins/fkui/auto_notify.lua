
local M = {}

function M.run()
  local fidget = require("fidget")

  -- Step 1: "Starting FkVim..."
  fidget.notify("🚀 Starting FkVim...", vim.log.levels.INFO)

  -- Step 2: "Loading Plugins..."
  vim.defer_fn(function()
    fidget.notify("📦 Loading Plugins...", vim.log.levels.INFO)
  end, 1200)

  -- Step 3: "Almost there..."
  vim.defer_fn(function()
    fidget.notify("✨ Almost there...", vim.log.levels.INFO)
  end, 2500)

  -- Step 4: "Ready to code!"
  vim.defer_fn(function()
    fidget.notify("✅ Ready to code!", vim.log.levels.INFO)
  end, 4000)
end

return M
