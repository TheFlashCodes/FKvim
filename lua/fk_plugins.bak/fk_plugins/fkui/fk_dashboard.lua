
return function()
  local snacks = require("snacks")

  snacks.setup({
    theme = "catppuccin", -- Options: dark / minimal / dracula / tokyonight / catppuccin

    header = {
      [[███████╗██╗  ██╗    ██╗   ██╗██╗███╗   ███╗]],
      [[██╔════╝██║ ██╔╝    ██║   ██║██║████╗ ████║]],
      [[█████╗  █████╔╝     ██║   ██║██║██╔████╔██║]],
      [[██╔══╝  ██╔═██╗     ██║   ██║██║██║╚██╔╝██║]],
      [[██║     ██║  ██╗    ╚██████╔╝██║██║ ╚═╝ ██║]],
      [[╚═╝     ╚═╝  ╚═╝     ╚═════╝ ╚═╝╚═╝     ╚═╝]],
      [[                                          ]],
      [[             F   K   v   i   m             ]],
    },

    footer = {
      "🦾 Designed for speed. Crafted for coders.",
      "🌐 Welcome to FKvim — NeoVim, Unleashed.",
      "👨‍💻 Developed by Mayank Kumar Jha",
    },

    sections = {
      recent_files = true,
      projects = true,
      -- git_status = true,
      -- lazy_stats = true,
    },

    recent_files = {
      max_items = 5,
    },

    projects = {
      max_items = 5,
    },
  })
end
