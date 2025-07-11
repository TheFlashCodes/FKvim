-- For Base Tool Kit 
vim.g.fk_kit = "PDK" -- or "PDK", "JDK", "BASE", etc.

require("fk_configs.fk_properties")
require("fk_configs.fk_cursor")
require("fk_configs.fk_binds")
require("fk_plugins.fkui.fknotifier")
require("fk_plugins.fkui.auto_notify")
-- Loading AutoScript Commands
require("fk_autoscripts")

--                      Loading All the plugins

-- 🚀 Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 🔐 Safe require function for modules
local function safe_require(module)
  local ok, mod = pcall(require, module)
  if not ok then
    vim.notify("Failed to load " .. module, vim.log.levels.ERROR)
    return nil
  end
  return mod
end


require("fk_plugins.fkplug")



-- Using Theme 
require("fk_plugins.fkui")

