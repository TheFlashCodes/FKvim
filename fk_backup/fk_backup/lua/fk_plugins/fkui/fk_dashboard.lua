-- lua/fk_plugins/fkui/fk_dashboard.lua

local logo = [[
███████╗██╗  ██╗    ██╗   ██╗██╗███╗   ███╗
██╔════╝██║ ██╔╝    ██║   ██║██║████╗ ████║
█████╗  █████╔╝     ██║   ██║██║██╔████╔██║
██╔══╝  ██╔═██╗     ██║   ██║██║██║╚██╔╝██║
██║     ██║  ██╗    ╚██████╔╝██║██║ ╚═╝ ██║
╚═╝     ╚═╝  ╚═╝     ╚═════╝ ╚═╝╚═╝     ╚═╝

          F   K   v   i   m               
]]

local function get_current_toolkit()
  local map = {
    BASE = "🧰 Base FKvim",
    WDK = "🌐 Web Dev Kit",
    PDK = "🐍 Python Dev Kit",
    JDK = "☕ Java Dev Kit",
  }
  return map[vim.g.fk_kit] or "🔧 Unknown Toolkit"
end


return {
  theme = "hyper",
  config = {
    header = vim.split(logo, "\n"),
    shortcut = {
      {
        desc = " New",
        group = "Green",
        action = "enew",
        key = "n",
      },
      {
        desc = "󰱼 Files",
        group = "Blue",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Recent",
        group = "Flamingo",
        action = "Telescope oldfiles",
        key = "r",
      },
      {
        desc = " Restore",
        group = "Yellow",
        action = "lua require('persistence').load()",
        key = "s",
      },
      {
        desc = "🎨 Themes",
        group = "Mauve",
        action = "Telescope colorscheme",
        key = "t",
      },
      {
        desc = "󰚰 Update",
        group = "Peach",
        action = "Lazy update",
        key = "u",
      },
      {
        desc = " Config",
        group = "Sky",
        action = "Telescope find_files cwd=~/.config/nvim",
        key = "c",
      },
      {
        desc = "󰿅 Quit",
        group = "Red",
        action = "qa",
        key = "q",
      },
    },

    project = {
      enable = true,
      limit = 5,
      icon = "📁 ",
      label = " Projects",
      action = "Telescope projects",
    },

    mru = {
      limit = 10,
      label = " Recent Files",
      icon = " ",
    },
 footer = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return {
      "",
      "🔧 Current Toolkit: " .. get_current_toolkit(),
      "",
      "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
      "🧠 Developed by Mayank Kumar Jha",
     }
   end,

 }
}
