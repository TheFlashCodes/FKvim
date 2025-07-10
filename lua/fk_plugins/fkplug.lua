
require("fk_plugins.fkcore.fk_diagnosis").setup()
require("fk_plugins.fkui.colors")
--require("fk_plugins.fkui.fkui")
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

    
    -- FK ToolKit Installer

{
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim"
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
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })

      local cp = require("catppuccin.palettes").get_palette("mocha")

      -- Highlight customizations
      vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = cp.blue })
      vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = cp.yellow })
      vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = cp.text })
      vim.api.nvim_set_hl(0, "NavicIconsMethod", { fg = cp.green })
      vim.api.nvim_set_hl(0, "NavicIconsModule", { fg = cp.mauve })
      vim.api.nvim_set_hl(0, "NavicIconsNamespace", { fg = cp.teal })
      vim.api.nvim_set_hl(0, "NavicIconsInterface", { fg = cp.lavender })
      vim.api.nvim_set_hl(0, "NavicText", { fg = cp.subtext1 })
      vim.api.nvim_set_hl(0, "NavicSeparator", { fg = cp.overlay0 })

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = cp.red, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = cp.peach, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = cp.yellow, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = cp.pink, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = cp.red })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = cp.yellow })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = cp.yellow })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = cp.pink })
    end,
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

  -- 🔍 Telescope
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
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json" },
        exclude_dirs = { "~/" },
      })
      require("telescope").load_extension("projects")
    end,
  },

  -- 🌈 Treesitter
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

  -- ✨ Completion
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
      "onsails/lspkind.nvim",
    },
    config = function()
      require("fk_plugins.fkcore.autofksuggest").setup()
    end,
  },

  -- 🧠 LSP & Mason
  { "neovim/nvim-lspconfig", lazy = true },
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "vtsls", "pyright", "jdtls" },
      })
      require("fk_plugins.fkcore.autofk").setup()
    end,
  },

  --FKui:  Dashboard
{
  "nvimdev/dashboard-nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/persistence.nvim",
    "catppuccin/nvim",
  },
  opts = function()
    return require("fk_plugins.fkui.fk_dashboard")
  end,
},

-- ⌨️ Which Key
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},

    -- 🧪 Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("fk_plugins.fk_term").setup()
    end,
  },

  -- 🔍 Git & Comments
  { "lewis6991/gitsigns.nvim" },
  { "numToStr/Comment.nvim" },

  -- 🧭 Navic Breadcrumbs
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    config = function()
      require("nvim-navic").setup({
        highlight = true,
        separator = "  ",
        depth_limit = 5,
      })
    end,
  },

  -- 🛎️ Notifications
-- nvim-notify
{
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    require("fk_plugins.fkui.fknotifier").setup()
  end,
},

-- noice.nvim

{
  "folke/noice.nvim",
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- nice floating input
      },
      messages = {
        enabled = true,
        view_search = "virtualtext", -- optionally "mini"
      },
      popupmenu = {
        enabled = true,
      },
      notify = {
        enabled = false, -- ⛔ disable noice handling notifications
      },
      lsp = {
        progress = { enabled = true },
        signature = { enabled = true },
        hover = { enabled = true },
        message = {
          enabled = true,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 4,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
    })
  end,
}

})
