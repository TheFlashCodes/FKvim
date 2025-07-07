
local M = {}

local ns_inline = vim.api.nvim_create_namespace("InlineDiagnosticLineOnly")
local show_line_diagnostics = true -- ✅ default to line-by-line
local show_global_inline = false   -- ❌ disable global inline by default

-- 🔁 Toggle inline diagnostics for all lines
function M.toggle_virtual_text_all()
  show_global_inline = not show_global_inline
  show_line_diagnostics = not show_global_inline

  vim.diagnostic.reset(ns_inline, 0)

  vim.diagnostic.config({ virtual_text = show_global_inline })

  if show_global_inline then
    vim.notify("✅ Inline diagnostics (all lines) enabled", vim.log.levels.INFO, { title = "FK Diagnosis" })
  else
    vim.notify("🚫 Inline diagnostics (all lines) disabled. Line diagnostics re-enabled", vim.log.levels.INFO, { title = "FK Diagnosis" })
    M.show_inline_current_line()
  end
end

-- 🔁 Toggle inline diagnostics for current line only
function M.toggle_virtual_text_line()
  show_line_diagnostics = not show_line_diagnostics
  show_global_inline = false

  vim.diagnostic.config({ virtual_text = false })
  vim.diagnostic.reset(ns_inline, 0)

  if show_line_diagnostics then
    M.show_inline_current_line()
    vim.notify("✅ Inline diagnostics (current line) enabled", vim.log.levels.INFO, { title = "FK Diagnosis" })
  else
    vim.notify("🚫 Inline diagnostics (current line) disabled", vim.log.levels.INFO, { title = "FK Diagnosis" })
  end
end

-- 🎯 Show diagnostics inline only for current line
function M.show_inline_current_line()
  if not show_line_diagnostics then return end

  local bufnr = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1

  vim.diagnostic.reset(ns_inline, bufnr)

  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
  if #diagnostics > 0 then
    vim.diagnostic.set(ns_inline, bufnr, diagnostics, {
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
    })
  end
end

-- 🪟 Show floating diagnostics
function M.show_floating_line()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })

  if #diagnostics == 0 then
    vim.notify("ℹ️ No diagnostics on current line", vim.log.levels.INFO, { title = "FK Diagnosis" })
    return
  end

  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "cursor",
    border = "rounded",
  })

  vim.notify("🔍 Floating diagnostics shown", vim.log.levels.INFO, { title = "FK Diagnosis" })
end

-- 🛠️ Setup
function M.setup()
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

  -- Disable global virtual text by default
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

  -- Setup autocmds
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      if show_line_diagnostics then
        M.show_inline_current_line()
      elseif not show_global_inline then
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
    callback = function()
      vim.diagnostic.reset(ns_inline, 0)
    end,
  })

  -- 🔑 Keymaps
  vim.keymap.set("n", "<leader>se", M.toggle_virtual_text_line, { desc = "Toggle inline diagnostics (current line)", silent = true })
  vim.keymap.set("n", "<leader>sa", M.toggle_virtual_text_all,  { desc = "Toggle inline diagnostics (all lines)", silent = true })
  vim.keymap.set("n", "<leader>sf", M.show_floating_line,       { desc = "Show floating diagnostics", silent = true })

  -- 🚀 Show line diagnostics on startup
  if show_line_diagnostics then
    vim.defer_fn(function()
      M.show_inline_current_line()
    end, 100)
  end
end

return M
