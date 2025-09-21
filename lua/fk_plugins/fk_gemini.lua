local M = {}

local gemini_term_buf = nil

local function install_or_update(cmd, installing_msg, success_msg, fail_msg)
  vim.notify(installing_msg, vim.log.levels.INFO)
  local job_id = vim.fn.jobstart(cmd, {
    on_exit = function(j_id, code, event) 
      if code == 0 then
        vim.notify(success_msg, vim.log.levels.INFO)
      else
        vim.notify(fail_msg .. ": " .. tostring(code), vim.log.levels.ERROR)
      end
    end,
  })
end

local function check_and_install_gemini()
  if vim.fn.executable('gemini') == 0 then
    vim.notify('gemini-cli not found. Please install it.', vim.log.levels.WARN)
    local choice = vim.fn.confirm('Install gemini-cli now?', '&Yes\n&No', 2)
    if choice == 1 then
      local cmd = ""
      if vim.fn.has("mac") == 1 then
        cmd = "npm install -g @google/gemini-cli" -- Assuming npm is available
      elseif vim.fn.has("unix") == 1 then
        cmd = "npm install -g @google/gemini-cli" -- Assuming npm is available
      else
        vim.notify("Unsupported OS for gemini installation", vim.log.levels.ERROR)
        return false
      end
      install_or_update(cmd, "Installing gemini-cli", "gemini-cli installed", "Installation failed")
      return false
    else
      vim.notify("gemini-cli not installed. FkGemini will not work.", vim.log.levels.ERROR)
      return false
    end
  end
  return true
end

local function find_gemini_term()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name and (name:match("term://.*gemini") or name:match("FkAI Gemini")) then
      return buf
    end
  end
  return nil
end

function M.toggle_gemini()
  if not check_and_install_gemini() then
    return
  end

  local term_buf = find_gemini_term()

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- If Gemini terminal exists and is valid, toggle its visibility
    local win_id = vim.fn.bufwinid(term_buf)
    if win_id ~= -1 then
      -- If the buffer is in a window, close the window
      vim.api.nvim_win_close(win_id, true)
    else
      -- If the buffer exists but is not in a window, open it
      vim.cmd('vsplit')
      vim.api.nvim_set_current_buf(term_buf)
    end
  else
    -- If no Gemini terminal exists or it's invalid, create a new one
    vim.cmd('vsplit term://gemini')
    vim.api.nvim_buf_set_name(0, "🖥️  FkAI Gemini")
    gemini_term_buf = vim.api.nvim_get_current_buf()
  end
end

function M.open_gemini(args)
  if not check_and_install_gemini() then
    return
  end

  if args and args[1] == "update" then
    local cmd = ""
    if vim.fn.has("mac") == 1 then
      cmd = "npm update -g @google/gemini-cli"
    elseif vim.fn.has("unix") == 1 then
      cmd = "npm update -g @google/gemini-cli"
    else
      vim.notify("Unsupported OS for gemini update", vim.log.levels.ERROR)
      return
    end
    install_or_update(cmd, "Updating gemini-cli", "gemini-cli updated", "Update failed")
  else
    M.toggle_gemini()
  end
end

function M.setup()
  vim.api.nvim_create_user_command('FkGemini', M.open_gemini, { nargs = '?' })
end

return M
