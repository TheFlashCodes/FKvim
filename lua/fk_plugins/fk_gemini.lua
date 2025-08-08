
local NuiPopup = require("nui.popup")
local Job = require("plenary.job")
local M = {}

-- 🌈 Popup progress bar
local function show_progress(title, stages, on_complete)
  local popup = NuiPopup({
    border = {
      style = "rounded",
      text = { top = title, top_align = "center" },
    },
    position = "50%",
    size = { width = 50, height = 6 },
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    },
  })

  popup:mount()

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {
    "🔄 Working...",
    "",
    "[                                 ] 0%",
  })

  local i = 1
  local timer = vim.loop.new_timer()
  timer:start(200, 300, vim.schedule_wrap(function()
    if i <= #stages then
      vim.api.nvim_buf_set_lines(popup.bufnr, 2, 3, false, { stages[i] })
      i = i + 1
    else
      timer:stop()
      timer:close()
      vim.defer_fn(function()
        popup:unmount()
        if on_complete then on_complete() end
      end, 500)
    end
  end))
end

-- 🛠️ Install or update
local function install_or_update(cmd, title, success_msg, fail_msg)
  show_progress("🚀 " .. title, {
    "  [███                              ] 10%",
    "  [███████                          ] 30%",
    "  [████████████                    ] 50%",
    "  [██████████████████              ] 70%",
    "  [████████████████████████        ] 90%",
    "  [███████████████████████████████] 100%",
  }, function()
    Job:new({
      command = "bash",
      args = { "-l", "-c", cmd },
      on_exit = function(_, return_val)
        vim.schedule(function()
          if return_val == 0 then
            vim.notify("✅ " .. success_msg, vim.log.levels.INFO)
          else
            vim.notify("❌ " .. fail_msg, vim.log.levels.ERROR)
          end
        end)
      end,
    }):start()
  end)
end

-- 📦 Setup check
function M.setup()
  if vim.fn.executable('gemini') == 0 then
    vim.notify('gemini-cli not found. Please install it.', vim.log.levels.WARN)
    local choice = vim.fn.confirm('Install gemini-cli now?', '&Yes\n&No', 2)
    if choice == 1 then
      local cmd = (vim.fn.has('mac') == 1 or vim.fn.has('unix') == 1)
        and "npm install -g @google/gemini-cli"
        or nil

      if cmd then
        install_or_update(cmd, "Installing gemini-cli", "gemini-cli installed", "Installation failed")
      else
        vim.notify('Unsupported OS. Please install manually.', vim.log.levels.ERROR)
      end
    end
  end
end

-- 🧠 Toggle Terminal
local function find_gemini_term()
  local bufs = vim.api.nvim_list_bufs()
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local name = vim.api.nvim_buf_get_name(buf)
      if name and (name:match("term://.*gemini") or name:match("FkAI Gemini")) then
        local chan = vim.api.nvim_buf_get_var(buf, 'terminal_job_id')
        if chan and vim.fn.jobwait({ chan }, 0)[1] == -1 then
          return buf
        end
      end
    end
  end
  return nil
end

function M.toggle_gemini()
  local term_buf = find_gemini_term()
  if term_buf then
    local win_id = vim.fn.bufwinid(term_buf)
    if win_id ~= -1 then
      vim.api.nvim_win_close(win_id, true)
    else
      vim.api.nvim_buf_delete(term_buf, { force = true })
    end
  else
    vim.cmd('vsplit term://gemini')
    vim.cmd('vertical resize 50')
    vim.api.nvim_buf_set_name(0, "🖥️  FkAI Gemini")
  end
end

-- 🔁 Update/Launch
function M.open_gemini(args)
  if args.fargs[1] == 'update' then
    local cmd = (vim.fn.has('mac') == 1 or vim.fn.has('unix') == 1)
      and "npm update -g @google/gemini-cli"
      or nil

    if cmd then
      install_or_update(cmd, "Updating gemini-cli", "gemini-cli updated", "Update failed")
    else
      vim.notify("Unsupported OS for update", vim.log.levels.ERROR)
    end
  else
    M.toggle_gemini()
  end
end

-- 📦 Direct install (from command)
function M.install_package(args)
  local package = args.fargs[1]
  if package == 'Gemini' then
    local cmd
    if vim.fn.has('mac') == 1 then
      cmd = "brew install gemini-cli"
    elseif vim.fn.has('unix') == 1 then
      cmd = "npm install -g @google/gemini-cli"
    end

    if cmd then
      install_or_update(cmd, "Installing gemini-cli", "gemini-cli installed", "Installation failed")
    else
      vim.notify("Unsupported OS for gemini installation", vim.log.levels.ERROR)
    end
  else
    vim.notify("❌ Package not supported: " .. package, vim.log.levels.ERROR)
  end
end

-- 🧩 Commands
vim.api.nvim_create_user_command('FkGemini', M.open_gemini, { nargs = '?' })
vim.api.nvim_create_user_command('FkInstall', M.install_package, { nargs = '*' })

return M
