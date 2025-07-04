local db = require("dashboard")

-- Hacker Quotes (randomized)
local hacker_quotes = {
  "💀 Hack the planet!",
  "👾 Code is poetry. FKvim is the pen.",
  "🔮 Vim isn’t just a tool. It’s a lifestyle.",
  "🚀 Run FKvim like you own the matrix.",
  "🧠 Every keystroke counts. Master your editor.",
}
math.randomseed(os.time())
local footer_quote = hacker_quotes[math.random(#hacker_quotes)]

-- Setup
db.setup({
  theme = "doom",
  config = {
    header = {
       "",
       "",
        "",

      [[███████╗██╗  ██╗    ██╗   ██╗██╗███╗   ███╗]],
      [[██╔════╝██║ ██╔╝    ██║   ██║██║████╗ ████║]],
      [[█████╗  █████╔╝     ██║   ██║██║██╔████╔██║]],
      [[██╔══╝  ██╔═██╗     ██║   ██║██║██║╚██╔╝██║]],
      [[██║     ██║  ██╗    ╚██████╔╝██║██║ ╚═╝ ██║]],
      [[╚═╝     ╚═╝  ╚═╝     ╚═════╝ ╚═╝╚═╝     ╚═╝]],
      [[                                          ]],
      [[           F   K   v   i   m              ]],
       [[                                         ]],
        },

    center = {
      {
        icon = "  ",
        icon_hl = "DashboardIcon",
        desc = "New File",
        desc_hl = "DashboardDesc",
        action = "enew",
        key = "n",
        key_hl = "DashboardKey",
      },
      {
        icon = "󰱼  ",
        icon_hl = "DashboardIcon",
        desc = "Find Files",
        desc_hl = "DashboardDesc",
        action = "Telescope find_files",
        key = "f",
        key_hl = "DashboardKey",
      },
      {
        icon = "📁 ",
        icon_hl = "DashboardIcon",
        desc = "Projects",
        desc_hl = "DashboardDesc",
        action = function()
            require("telescope").extensions.project.project({})
          end,
        key = "p",
        key_hl = "DashboardKey",
      },
      {
        icon = " ",
        icon_hl = "DashboardIcon",
        desc = "Terminal (horizontal)",
        desc_hl = "DashboardDesc",
        action = "ToggleTerm direction=horizontal",
        key = "t",
        key_hl = "DashboardKey",
      },
      {
        icon = " ",
        icon_hl = "DashboardIcon",
        desc = "Edit Config",
        desc_hl = "DashboardDesc",
        action = "NvimTreeOpen ~/.config/nvim",
        key = "c",
        key_hl = "DashboardKey",
      },
      {
        icon = "󰿅  ",
        icon_hl = "DashboardIcon",
        desc = "Exit",
        desc_hl = "DashboardDesc",
        action = "qa",
        key = "q",
        key_hl = "DashboardKey",
      },
    },

    footer = {
      "",
      "🦾 Designed for speed. Crafted for coders.",
      "🌐 Welcome to FKvim — NeoVim, Unleashed.",
      "💬 " .. footer_quote,
      "",
      "👨‍💻 Developed by Mayank Kumar Jha",
      "",
    },
  },
})

-- Optional: center dashboard view
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt_local.winfixwidth = true
    vim.opt_local.winwidth = 100
  end,
})




