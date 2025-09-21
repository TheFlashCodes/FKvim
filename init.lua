-- For Base Tool Kit 
vim.g.fk_kit = "BASE" -- or "PDK", "JDK", "BASE", etc.

require("fk_configs.fk_properties")
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
require("fk_configs.fk_cursor")
require("fk_configs.fk_binds")
require("fk_plugins.fkplug")
require("fk_plugins.fkui.fknotifier").setup()
require("fk_plugins.fkui.auto_notify").run()

require("fk_plugins.fk_gemini")
require("fk_plugins.fk_gemini").setup()





-- Using Theme 
require("fk_plugins.fkui")

-- Show goodbye message on exit
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    require("fk_plugins.fkui.goodbye").show()
    vim.cmd("sleep 1")
  end,
})

vim.api.nvim_set_hl(0, "FloatTitle", { link = "NormalFloat" })

