require("nvchad.configs.lspconfig").defaults()

local servers = { "ts_ls", "rust_analyzer", "gopls", "lua_ls" }
vim.lsp.enable(servers)

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "clippy" },
      cargo = { allFeatures = true },
      procMacro = { enable = true },
    },
  },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
