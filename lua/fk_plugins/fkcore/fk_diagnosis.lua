local M = {}

-- Track inline diagnostics globally and per line
local inline_enabled_global = false
local ns_inline = vim.api.nvim_create_namespace("InlineDiagnosticLineOnly")

-- 🔁 Toggle virtual text for all lines
function M.toggle_virtual_text_all()
  inline_enabled_global = not inline_enabled_global

  vim.diagnostic.config({ virtual_text = inline_enabled_global })

  vim.notify(
    inline_enabled_global and "✅ Inline diagnostics (all lines) enabled"
    or "🚫 Inline diagnostics (all lines) disabled",
    vim.log.levels.INFO,
    { title = "Diagnostics" }
  )
end

-- 🔁 Toggle virtual text for current line only
function M.toggle_virtual_text_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1

  -- Clear previous diagnostics from namespace
  vim.diagnostic.reset(ns_inline, bufnr)

  local diagnostics = vim.diagnostic.get(bufnr, { lnum = cursor_line })
  if #diagnostics == 0 then
    vim.notify("ℹ️ No diagnostics on current line", vim.log.levels.INFO, { title = "Diagnostics" })
    return
  end

  vim.diagnostic.set(ns_inline, bufnr, diagnostics, {
    virtual_text = {
      prefix = "●",
      spacing = 2,
    },
  })

  vim.notify("✅ Inline diagnostics shown for current line", vim.log.levels.INFO, { title = "Diagnostics" })
end

-- 🪟 Show floating diagnostics for current line
function M.show_floating_line()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = cursor_line })

  if #diagnostics == 0 then
    vim.notify("ℹ️ No diagnostics on current line", vim.log.levels.INFO, { title = "Diagnostics" })
    return
  end

  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "cursor",
    border = "rounded",
  })

  vim.notify("🔍 Floating diagnostics shown for current line", vim.log.levels.INFO, { title = "Diagnostics" })
end

-- 🔧 Setup diagnostics
function M.setup()
  -- Sign icons
  local signs = {
    Error = " ",
    Warn  = " ",
    Hint  = "󰌵 ",
    Info  = " ",
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Diagnostic config (global inline disabled)
  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
  })

  -- Auto popup on CursorHold if global inline disabled
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
      if not inline_enabled_global then
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
      end
    end,
  })

  -- Clear inline for current line on move
  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
    callback = function()
      vim.diagnostic.reset(ns_inline, 0)
    end,
  })

  -- Keymaps
  vim.keymap.set("n", "<leader>se", M.toggle_virtual_text_line, { desc = "Show inline diagnostics for current line", silent = true })
  vim.keymap.set("n", "<leader>sa", M.toggle_virtual_text_all,  { desc = "Toggle inline diagnostics for all lines", silent = true })
  vim.keymap.set("n", "<leader>sf", M.show_floating_line,        { desc = "Show floating diagnostics for current line", silent = true })
end

return M

