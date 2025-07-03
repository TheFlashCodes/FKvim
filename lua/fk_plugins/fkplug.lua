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

-- 🔐 Safe require function
local function safe_require(module)
  local status, mod = pcall(require, module)
  if not status then
    vim.notify("Failed to load " .. module, vim.log.levels.ERROR)
  end
  return mod
end

-- 📦 Install plugins with lazy.nvim
require("lazy").setup({
  -- 💅 Status line
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
        extra_groups = { "NormalFloat", "NvimTreeNormal" },
      })
    end,
  },

  -- 🎨 Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
})


vim.cmd.colorscheme("catppuccin")

