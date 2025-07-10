
local db = require("dashboard")

-- 📜 Quotes
local hacker_quotes = {
  "💀 Hack the planet!",
  "👾 Code is poetry. FKvim is the pen.",
  "🔮 Vim isn’t just a tool. It’s a lifestyle.",
  "🚀 Run FKvim like you own the matrix.",
  "🧠 Every keystroke counts. Master your editor.",
}
math.randomseed(os.time())
local footer_quote = hacker_quotes[math.random(#hacker_quotes)]



local function get_recent_files(limit)
  local recent = {}
  local count = 0
  for _, path in ipairs(vim.v.oldfiles) do
    print("Checking file: " .. path)  -- DEBUG LINE
    if vim.fn.filereadable(path) == 1 then
      local short = vim.fn.fnamemodify(path, ":~")
      table.insert(recent, {
        icon = " ",
        icon_hl = "DashboardIcon",
        desc = short,
        desc_hl = "DashboardDesc",
        action = "e " .. path,
        key = tostring(count + 1),
        key_hl = "DashboardKey",
      })
      count = count + 1
    end
    if count >= limit then break end
  end
  return recent
end

-- 🕓 Recent Files
local function get_recent_files(limit)
  local recent = {}
  local count = 0
  for _, f in ipairs(vim.v.oldfiles) do
    if vim.fn.filereadable(f) == 1 then
      local path = vim.fn.fnamemodify(f, ":~")
      table.insert(recent, {
        icon = " ",
        icon_hl = "DashboardIcon",
        desc = path,
        desc_hl = "DashboardDesc",
        action = "edit " .. f,
        key = tostring(count + 1),
        key_hl = "DashboardKey",
      })
      count = count + 1
    end
    if count >= limit then break end
  end
  return recent
end

-- 📁 Recent Projects (dummy paths or Telescope projects)
local function get_projects()
  local paths = {
    "~/.config/nvim",
    "~/workspace/dashboard-nvim",
    "~/workspace/strivex",
    "~/projects/flashcodes",
  }
  local items = {}
  for i, p in ipairs(paths) do
    table.insert(items, {
      icon = " ",
      icon_hl = "DashboardIcon",
      desc = vim.fn.fnamemodify(p, ":~"),
      desc_hl = "DashboardDesc",
      action = "cd " .. p,
      key = tostring(i + 5),
      key_hl = "DashboardKey",
    })
  end
  return items
end

-- 🧠 Compose center items
local center_items = {
  {
    icon = " ",
    icon_hl = "DashboardIcon",
    desc = "New File",
    desc_hl = "DashboardDesc",
    action = "enew",
    key = "n",
    key_hl = "DashboardKey",
  },
  {
    icon = "󰱼 ",
    icon_hl = "DashboardIcon",
    desc = "Find Files",
    desc_hl = "DashboardDesc",
    action = "Telescope find_files",
    key = "f",
    key_hl = "DashboardKey",
  },
  {
    icon = " ",
    icon_hl = "DashboardIcon",
    desc = "Terminal",
    desc_hl = "DashboardDesc",
    action = "ToggleTerm direction=horizontal",
    key = "t",
    key_hl = "DashboardKey",
  },
  {
    icon = " ",
    icon_hl = "DashboardIcon",
    desc = "Config",
    desc_hl = "DashboardDesc",
    action = "Telescope find_files cwd=~/.config/nvim",
    key = "c",
    key_hl = "DashboardKey",
  },
  {
    icon = "󰿅 ",
    icon_hl = "DashboardIcon",
    desc = "Quit",
    desc_hl = "DashboardDesc",
    action = "qa",
    key = "q",
    key_hl = "DashboardKey",
  },
  {
    icon = "📁 ",
    icon_hl = "DashboardIcon",
    desc = "--- Recent Projects ---",
    action = "",
  },
}

-- Combine all sections
center_items = vim.list_extend(center_items, get_projects())
table.insert(center_items, {
  icon = "🕓 ",
  icon_hl = "DashboardIcon",
  desc = "--- Recent Files ---",
  action = "",
})
center_items = vim.list_extend(center_items, get_recent_files(7))

-- 🧱 Setup dashboard
db.setup({
  theme = "doom",
  config = {
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
    center = center_items,
    footer = {
      "🦾 Designed for speed. Crafted for coders.",
      "🌐 Welcome to FKvim — NeoVim, Unleashed.",
      "💬 " .. footer_quote,
      "👨‍💻 Developed by Mayank Kumar Jha",
    },
  },
})

-- Auto format dashboard window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt_local.winfixwidth = true
    vim.opt_local.winwidth = 100
  end,
})

-- Load notify
vim.defer_fn(function()
  vim.notify("✅ FKvim ready. Open your next file and build something epic.", vim.log.levels.INFO, {
    title = "FKvim Dashboard",
  })
end, 500)
