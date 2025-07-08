-- FKvim Loading Notifications
vim.schedule(function()
  require("fk_plugins.fkui.auto_notify").run()
end)



-- Files History Loader for Dashboard
vim.o.shada = "'100,<50,s10,h"


-- Fkvim Command
vim.api.nvim_create_user_command("Fkvim", function()
  -- This works if you're using `dashboard-nvim` as your dashboard plugin
  vim.cmd("enew")                          -- open a new empty buffer
  vim.cmd("Dashboard")                    -- launch the dashboard
end, {})


-- 🔁 Toggle cursorline only in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- 🎨 Transparent cursorline on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
  end,
})

-- 🖱 Required for LSP hover to work
vim.o.mousemoveevent = true

-- 🧠 Smart winbar using nvim-navic breadcrumbs
_G.get_winbar = function()
  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok and navic.is_available() then
    return navic.get_location()
  end
  return ""
end

vim.o.winbar = "%{%v:lua.get_winbar()%}"


-- Autoscript to run Update
vim.api.nvim_create_user_command("FkUpdate", function()
  require("fk_plugins.fkcore.fk_updater").update_fkvim()
end, {})

