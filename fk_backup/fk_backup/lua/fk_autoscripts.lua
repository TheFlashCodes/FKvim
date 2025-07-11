-- FKvim Loading Notifications
vim.schedule(function()
  require("fk_plugins.fkui.auto_notify").run()
end)

-- Bootstrapping for First Time (only once)
vim.defer_fn(function()
  local data_path = vim.fn.stdpath("data")
  local install_flag = data_path .. "/.fkvim_installed"

  local file_exists = vim.fn.filereadable(install_flag) == 1
  local no_args = vim.fn.argc() == 0

  -- Show only if not installed AND no file passed to nvim
  if not file_exists and no_args then
    require("fk_plugins.fkcore.fkInstaller").open()

    -- Write flag AFTER some delay (ensure installer loads)
    vim.defer_fn(function()
      local f = io.open(install_flag, "w")
      if f then
        f:write("installed=true\n")
        f:close()
      end
    end, 500)
  end
end, 100)



-- FkInstall Cmd 
vim.api.nvim_create_user_command("FkInstall", function()
  local ok, installer = pcall(require, "fk_plugins.fkcore.fkInstaller")
  if not ok or type(installer) ~= "table" or type(installer.open) ~= "function" then
    vim.notify("❌ Failed to load FKvim Installer:\n" .. tostring(installer), vim.log.levels.ERROR)
    return
  end

  installer.open()
end, { desc = "Open FKvim Toolkit Installer" })


--Resest Installation again

vim.api.nvim_create_user_command("FkResetInstall", function()
  local flag = vim.fn.stdpath("data") .. "/.fkvim_installed"
  if vim.fn.filereadable(flag) == 1 then
    os.remove(flag)
    vim.notify("🔁 FKvim installer reset. Restart Neovim to run it again.", vim.log.levels.INFO)
  else
    vim.notify("ℹ️ FKvim installer is already unset or never run.", vim.log.levels.WARN)
  end
end, { desc = "Reset FKvim installer (show on next launch)" })

-- Temporarily ToolkitChnagers 
vim.api.nvim_create_user_command("FkSetKit", function()
  vim.ui.select({ "BASE", "WDK", "PDK", "JDK" }, {
    prompt = "Select FKvim Toolkit:",
  }, function(choice)
    if choice then
      vim.g.fk_kit = choice
      vim.notify("🔁 FKvim Toolkit set to " .. choice, vim.log.levels.INFO, { title = "FKvim" })
      vim.cmd("Dashboard")
    end
  end)
end, { desc = "Temporarily change FKvim toolkit" })






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

