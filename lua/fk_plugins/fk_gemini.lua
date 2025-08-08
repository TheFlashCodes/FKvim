local M = {}

function M.setup()
  -- Check if gemini-cli is installed
  if vim.fn.executable('gemini') == 0 then
    vim.notify('gemini-cli not found. Please install it.', vim.log.levels.WARN)
    -- offer to install it
    local choice = vim.fn.confirm('Install gemini-cli now?', '&Yes &No', 2)
    if choice == 1 then
      -- Run the install script
        if vim.fn.has('mac') == 1 then
            vim.fn.system('npm install -g @google/gemini-cli')
        elseif vim.fn.has('unix') == 1 then
            vim.fn.system('npm install -g @google/gemini-cli')
        else
            vim.notify('OS not supported for automatic installation. Please install gemini-cli manually.', vim.log.levels.ERROR)
        end
    end
  end
end

local function find_gemini_term()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            if name and (name:match("term://.*gemini") or name:match("FkAI Gemini")) then
                local chan = vim.api.nvim_buf_get_var(buf, 'terminal_job_id')
                if chan and vim.fn.jobwait({chan}, 0)[1] == -1 then
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
            vim.api.nvim_buf_delete(term_buf, {force = true})
        end
    else
        vim.cmd('vsplit term://gemini')
        vim.cmd('vertical resize 50')
        vim.api.nvim_buf_set_name(0, "🖥️  FkAI Gemini")
    end
end

function M.open_gemini(args)
  if args.fargs[1] == 'update' then
    if vim.fn.has('mac') == 1 then
      vim.fn.system('brew upgrade gemini-cli')
    elseif vim.fn.has('unix') == 1 then
      vim.fn.system('npm update -g @google/gemini-cli')
    else
      vim.notify('OS not supported for automatic update. Please update gemini-cli manually.', vim.log.levels.ERROR)
    end
  else
    M.toggle_gemini()
  end
end

function M.install_package(args)
  local package = args.fargs[1]
  if package == 'Gemini' then
    if vim.fn.has('mac') == 1 then
      vim.fn.system('brew install gemini-cli')
    elseif vim.fn.has('unix') == 1 then
      vim.fn.system('npm install -g @google/gemini-cli')
    else
      vim.notify('OS not supported for automatic installation. Please install gemini-cli manually.', vim.log.levels.ERROR)
    end
  else
    vim.notify('Package not supported: ' .. package, vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command('FkGemini', M.open_gemini, { nargs = '?' })
vim.api.nvim_create_user_command('FkInstallGemini', M.install_package, { nargs = '*' })

return M
