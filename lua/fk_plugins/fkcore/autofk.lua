local M = {}

function M.setup()
  -- 🧩 LSP capabilities for nvim-cmp
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- 🛠️ Setup LSP servers (installed via mason-lspconfig)
  local lspconfig = require("lspconfig")
  local servers = { "lua_ls", "ts_ls", "pyright" } -- exclude jdtls here

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      capabilities = capabilities,
    })
  end

  -- 🔧 Special handling for Java (jdtls)
  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  if vim.fn.isdirectory(jdtls_path) == 1 then
    -- Optional: manually call jdtls when opening Java files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach({
          cmd = { jdtls_path .. "/bin/jdtls" },
          root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
          capabilities = capabilities,
        })
      end,
    })
  end
end

return M

