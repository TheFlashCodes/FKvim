local M = {}

function M.setup()
  local ok, code_runner = pcall(require, "code_runner")
  if not ok then
    vim.notify("code_runner.nvim not found!", vim.log.levels.ERROR)
    return
  end

  code_runner.setup({
    mode = "toggleterm", -- default: run inside ToggleTerm
    focus = true,
    startinsert = true,
    filetype = {
      python = "python3 -u",
      go = "go run",
      javascript = "node",
      typescript = "ts-node",
      sh = "bash",
      rust = "cargo run",
      c = {
        "cd $dir &&",
        "gcc $fileName -o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt"
      },
      cpp = {
        "cd $dir &&",
        "g++ $fileName -o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt"
      },
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt"
      },
    },
  })

  -- 🚀 Wrap CodeRunner with Fkvim commands
  vim.api.nvim_create_user_command("Fkrun", function()
    vim.cmd("RunFile")
  end, {})

  vim.api.nvim_create_user_command("FkrunProject", function()
    vim.cmd("RunProject")
  end, {})

  vim.api.nvim_create_user_command("FkrunClose", function()
    vim.cmd("RunClose")
  end, {})

  -- 🔑 Keymaps
  vim.keymap.set("n", "<leader>rr", ":Fkrun<CR>", { desc = "Run current file" })
  vim.keymap.set("n", "<leader>rp", ":FkrunProject<CR>", { desc = "Run project" })
  vim.keymap.set("n", "<leader>rc", ":FkrunClose<CR>", { desc = "Close runner" })
end

return M
