
-- 🚀 Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 🔐 Safe require
local function safe_require(module)
  local ok, mod = pcall(require, module)
  if not ok then
    vim.notify("Failed to load " .. module, vim.log.levels.ERROR)
  end
  return mod
end


-- 📦 Lazy plugin setup
require("lazy").setup({

  -- 💅 Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("fk_plugins.fkcore.fk_status").setup({})
    end,
  },

  -- ✨ Transparent background
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "NormalFloat", "NvimTreeNormal", "FloatBorder",
          "TelescopeNormal", "ToggleTermNormal", "ToggleTermBorder",
        },
      })
    end,
  },

  -- 🎨 Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },

  -- 🧩 Indentation Guides
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufReadPre",
    config = function()
      require("fk_configs.fk_indent").setup()
    end,
  },

  -- 🖥️ Dashboard
  {
    "glepnir/dashboard-nvim",
    config = function()
      safe_require("fk_plugins.fkui")
    end,
  },

  -- 📁 File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("fk_plugins.fk_neotre").setup()
    end,
  },

  -- 🔁 Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre",
    config = function()
      require("fk_plugins.fkui.fk_buffer").setup()
    end,
  },

  -- 🔍 Telescope (Fuzzy Finder)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("fk_plugins.fk_telescope").setup()
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("project")
    end,
  },

  -- 🌈 Treesitter (Syntax Highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "html", "css", "markdown", "vim" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },

  -- ✨ Completion Engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim", -- 🧠 Icons for completions
    },
    config = function()
      require("fk_plugins.fkcore.autofksuggest").setup()
    end,
  },

  -- 🧠 Mason (LSP Installer)
  { "neovim/nvim-lspconfig", lazy = true },

  { "williamboman/mason.nvim", config = true },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "jdtls" },
      })
      require("fk_plugins.fkcore.autofk").setup()
    end,
  },

  -- 🧪 Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("fk_plugins.fk_term").setup()
    end,
    event = "VeryLazy",
  },

  -- 🔍 Git & Comments
  { "lewis6991/gitsigns.nvim" },
  { "numToStr/Comment.nvim" },
})
