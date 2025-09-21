
local M = {}

function M.show()
  local fidget = require("fidget")
  fidget.notify("👋 Goodbye!", vim.log.levels.INFO)
end

return M
