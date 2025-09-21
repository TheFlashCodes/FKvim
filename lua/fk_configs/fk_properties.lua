local opt = vim.opt

-- General
opt.number = true            -- show line numbers
opt.relativenumber = true    -- relative line numbers
opt.mouse = 'a'              -- enable mouse
opt.clipboard = 'unnamedplus'-- use system clipboard
opt.termguicolors = true     -- true color support
opt.cursorline = false        -- highlight current line
opt.signcolumn = "yes"       -- always show sign column

-- Tabs & Indentation
opt.expandtab = true         -- convert tabs to spaces
opt.shiftwidth = 4           -- spaces per indent
opt.tabstop = 4               -- spaces per tab
opt.smartindent = true       -- smart autoindent

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.wrap = false

-- General Settings  and Winbar settings 

vim.o.mousemoveevent = true 

