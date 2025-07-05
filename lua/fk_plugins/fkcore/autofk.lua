
local M = {}

function M.setup()
  -- 🧩 LSP capabilities for nvim-cmp
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local navic = require("nvim-navic")

  -- 🛠️ Setup LSP servers (installed via mason-lspconfig)
  local lspconfig = require("lspconfig")
  local servers = { "lua_ls", "ts_ls", "pyright" }

  local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end

  -- 🔧 Special handling for Java (jdtls)
  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  if vim.fn.isdirectory(jdtls_path) == 1 then
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach({
          cmd = { jdtls_path .. "/bin/jdtls" },
          root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
    })
  end
end

return M
