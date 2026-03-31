local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
