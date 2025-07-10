local M = {}

local function reload()
  vim.cmd("e ~/.config/nvim/init.lua")
end

function M.install(branch)
  local cmd = string.format("git fetch origin %s && git checkout %s", branch, branch)
  vim.fn.system(cmd)
  vim.notify("FKvim switched to " .. branch .. " toolkit. Restart Neovim!", vim.log.levels.INFO)
end

return M

