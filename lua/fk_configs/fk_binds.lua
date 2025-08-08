-- Global keymap definitions for FKvim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "  -- Space as leader key

-- 📝 File
    map("n", "<leader>w", ":w<CR>", opts)
    map("n", "<leader>q", ":q<CR>", opts)
    map("n", "<leader>x", ":bd<CR>", opts)
    map("n", "<leader>rr", ":source $MYVIMRC<CR>", opts)

-- 📋 Clipboard

  -- Copy
   map("n", "<leader>y", '"+yy', opts)                                        -- 📄 Copy current line to system clipboard
   map("v", "<leader>y", '"+y', opts)                                         -- 📄 Copy visual selection to clipboard
   map("n", "<leader>Y", 'ggVG"+y', { desc = "📄 Copy entire file" })         -- 📄 Copy whole buffer
   map("n", "<leader>a", "ggVG", { desc = "🅰️ Select All" })                 -- 🅰️ Select all content

  -- Paste
    map("n", "<leader>p", '"+p', { desc = "📋 Paste from clipboard" })         -- 📋 Paste clipboard
    map("v", "<leader>p", '"+p', { desc = "📋 Paste over selection" })         -- 📋 Paste in visual mode
    map("i", "<C-v>", '<C-r>+', { desc = "📋 Paste in insert mode" })          -- 📋 Paste in insert mode

  -- Cut
    map("v", "<leader>x", '"+d', { desc = "✂️ Cut selected to clipboard" })    -- ✂️ Cut selected text
    map("n", "<leader>x", '"+dd', { desc = "✂️ Cut current line to clipboard" }) -- ✂️ Cut current line

  -- Delete
    map("v", "<leader>d", '"_d', { desc = "🧽 Delete selection (no clipboard)" }) -- 🧽 Delete to blackhole
    map("n", "<leader>d", '"_dd', { desc = "🧽 Delete line (no clipboard)" })     -- 🧽 Delete line

  -- Undo / Redo
    map("n", "u", "u", { desc = "↩️ Undo" })
    map("n", "<C-r>", "<C-r>", { desc = "↪️ Redo" })

  -- Select All
    map("i", "<C-a>", '<Esc>ggVG"+ygi', { desc = "🅰️ Select all & copy in insert" }) -- Insert mode: Select & copy all

-- 🔀 Window Navigation
    map("n", "<C-h>", "<C-w>h", opts)
    map("n", "<C-l>", "<C-w>l", opts)
    map("n", "<C-j>", "<C-w>j", opts)
    map("n", "<C-k>", "<C-w>k", opts)

-- 🔍 Telescope
    map("n", "<leader>/", ":Telescope find_files<CR>", opts)
    map("n", "<leader>//", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
    map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
    map("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)  -- recently opened
    map("n", "<leader>rp", "<cmd>Telescope project<CR>", { desc = "Recent Projects" })

-- 🤖 Gemini
    map("n", "<leader>g", ":lua require('fk_plugins.fk_gemini').toggle_gemini()<CR>", { desc = "🤖 FkGemini" })


-- 📂 NeoTree
    map("n", "<leader>e", ":Neotree toggle<CR>", opts)
    map("n", "<leader>f", ":Neotree reveal<CR>", opts)

-- 🧱 Terminal
    map("n", "<leader>tt", ":ToggleTerm<CR>", opts)
    map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
    map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
    map("n", "<leader>tc", "<cmd>ToggleTermToggleAll<CR>", opts)

-- 🔃 Reload
    map("n", "<leader>lr", ':!browser-sync start --server --files "*.html, *.css, *.js"<CR>', opts)


-- FK Buffer Bindings 

-- BufferLine navigation
    map('n', '<Leader>bn', ':BufferLineCycleNext<CR>', opts)
    map('n', '<Leader>bp', ':BufferLineCyclePrev<CR>', opts)
    map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
    map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
    map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
    map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
    map('n', '<Leader>rc', ':BufferLinePickClose<CR>', opts)
    map('n', '<Leader>bo', ':BufferLineCloseRight<CR>', opts)
    map('n', '<Leader>bi', ':BufferLineCloseLeft<CR>', opts)
    map('n', '<Leader>bp', ':BufferLinePick<CR>', opts)
    map('n', '<Leader>bl', ':BufferLineMovePrev<CR>', opts)
    map('n', '<Leader>bm', ':BufferLineMoveNext<CR>', opts)
    map('n', '<Leader>bp', ':BufferLineTogglePin<CR>', opts)
    map('n','<Leader>bd', '<cmd>bd<CR>', opts, { desc = "Delete Buffer" })

    -- Reorder buffers
        map("n", "<leader>bl", ":BufferLineMovePrev<CR>", opts)
        map("n", "<leader>bm", ":BufferLineMoveNext<CR>", opts)

    -- Pin/Unpin buffer
        map("n", "<leader>bp", ":BufferLineTogglePin<CR>", opts)

    -- Pick & close buffer (optional)
        map("n", "<leader>rc", ":BufferLinePickClose<CR>", opts)


-- Navigation Keys 
vim.keymap.set("n", "<D-Right>", "<C-w>l", { desc = "Move to Code (Right)", noremap = true, silent = true })
vim.keymap.set("n", "<D-Left>", "<C-w>h", { desc = "Move to Neo-tree (Left)", noremap = true, silent = true })



