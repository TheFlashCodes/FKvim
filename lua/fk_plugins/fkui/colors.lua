local cp = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = cp.blue })
vim.api.nvim_set_hl(0, "NavicIconsClass",    { fg = cp.yellow })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = cp.text })
vim.api.nvim_set_hl(0, "NavicIconsMethod",   { fg = cp.green })
vim.api.nvim_set_hl(0, "NavicIconsModule",   { fg = cp.mauve })
vim.api.nvim_set_hl(0, "NavicIconsNamespace",{ fg = cp.teal })
vim.api.nvim_set_hl(0, "NavicIconsInterface",{ fg = cp.lavender })

-- Optional: separator and text
vim.api.nvim_set_hl(0, "NavicText", { fg = cp.subtext1 })
vim.api.nvim_set_hl(0, "NavicSeparator", { fg = cp.overlay0 })
