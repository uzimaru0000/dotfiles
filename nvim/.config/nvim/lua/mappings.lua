require "nvchad.mappings"

local map = vim.keymap.set
-- Diagnostics
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Floating diagnostic" })

-- Word wrap friendly j/k
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- LSP extras (NvChad defaults: gd, gD, K, <leader>ra are kept)
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP references" })
map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP implementations" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })

-- Window resize
map("n", "<leader>h", "<cmd>vertical resize -2<CR>", { desc = "Window narrow" })
map("n", "<leader>l", "<cmd>vertical resize +2<CR>", { desc = "Window widen" })

-- Telescope extras
map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown { winblend = 10, previewer = false }
  )
end, { desc = "Fuzzy search in buffer" })
