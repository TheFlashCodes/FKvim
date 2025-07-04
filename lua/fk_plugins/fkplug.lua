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
      require("lualine").setup({})
    end,
  },

  -- ✨ Transparent background
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = { "NormalFloat", "NvimTreeNormal","NormalFloat", "FloatBorder", "TelescopeNormal",
                        "ToggleTermNormal", "ToggleTermBorder"},
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
      transparent_background = true, },
  },

  -- 🧩 ONLY USE ONE INDENT PLUGIN
  -- ✅ Recommended: mini.indentscope (with animation)
  {
     "echasnovski/mini.indentscope",
       version = false,
       event = "BufReadPre",
       config = function()
       require("fk_configs.fk_indent").setup()
    end,
  },

  -- ❌ Optional: If you want ibl instead, uncomment below and disable mini.indentscope
  -- {
     --"lukas-reineke/indent-blankline.nvim",
     --main = "ibl",
     --event = "BufReadPre",
     --config = function()
      --   require("fk_plugins.fk_indent").setup()
    --  end,
  -- },


   --FKvim Deshboard 
   --
  {
    "glepnir/dashboard-nvim",
    config = function()
      safe_require("fk_plugins.fkui")
    end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Comments
  { "numToStr/Comment.nvim" },
  

  -- Neotree (File Explorer)
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

  -- FKterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("fk_plugins.fk_term").setup()
    end,
    event = "VeryLazy", -- optional lazy load
  },

  -- FKbuffer
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre",
    config = function()
        require("fk_plugins.fkui.fk_buffer").setup()
    end,
  },
  

  --FKtelescope
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

})

