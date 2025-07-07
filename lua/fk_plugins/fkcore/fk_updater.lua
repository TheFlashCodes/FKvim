-- lua/fk_plugins/fkcore/fk_updater.lua

local M = {}

-- Check internet connection
local function is_online()
  local handle = io.popen("ping -q -c 1 -W 2 github.com > /dev/null && echo 1 || echo 0")
  if not handle then return false end
  local result = handle:read("*a")
  handle:close()
  return result:match("1")
end

-- Run shell commands safely
local function run(cmd)
  local ok = os.execute(cmd)
  return ok == true or ok == 0
end

function M.update_fkvim()
  if not is_online() then
    vim.notify("❌ No internet connection. FKvim update cancelled.", vim.log.levels.ERROR)
    return
  end

  vim.notify("🚀 Starting FKvim update...", vim.log.levels.INFO, { title = "FKvim Updater" })

  local nvim_path = vim.fn.stdpath("config")
  local git_pull = "cd " .. nvim_path .. " && git pull origin main"
  local lazy_update = "nvim --headless \"+Lazy update\" +qa"

  -- Optional: backup fk_plugins (1 level only)
  local backup_cmd = "cp -r " .. nvim_path .. "/lua/fk_plugins " .. nvim_path .. "/lua/fk_plugins.bak"

  -- Step 1: Backup core (optional)
  run(backup_cmd)

  -- Step 2: Git pull
  local ok_pull = run(git_pull)
  if not ok_pull then
    vim.notify("❌ Git pull failed. Check your FKvim repo.", vim.log.levels.ERROR)
    return
  end

  -- Step 3: Lazy.nvim update
  local ok_lazy = run(lazy_update)
  if ok_lazy then
    vim.notify("✅ FKvim and Plugins updated!", vim.log.levels.INFO, { title = "FKvim Updater" })
  else
    vim.notify("⚠️ FKvim core updated but Lazy plugins failed to update.", vim.log.levels.WARN)
  end
end

return M

