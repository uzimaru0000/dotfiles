return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "gopls" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx", "json",
        "rust", "toml",
        "go", "gomod", "gosum",
        "markdown", "markdown_inline", "yaml", "bash", "fish",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = { lookahead = true },
        move = { set_jumps = true },
      }

      local select = function(query)
        return function()
          require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
        end
      end
      local move_next = function(query)
        return function()
          require("nvim-treesitter-textobjects.move").goto_next_start(query, "textobjects")
        end
      end
      local move_prev = function(query)
        return function()
          require("nvim-treesitter-textobjects.move").goto_previous_start(query, "textobjects")
        end
      end

      local map = vim.keymap.set

      -- Select text objects
      map({ "x", "o" }, "aa", select "@parameter.outer", { desc = "outer parameter" })
      map({ "x", "o" }, "ia", select "@parameter.inner", { desc = "inner parameter" })
      map({ "x", "o" }, "af", select "@function.outer", { desc = "outer function" })
      map({ "x", "o" }, "if", select "@function.inner", { desc = "inner function" })
      map({ "x", "o" }, "ac", select "@class.outer", { desc = "outer class" })
      map({ "x", "o" }, "ic", select "@class.inner", { desc = "inner class" })

      -- Move between text objects
      map({ "n", "x", "o" }, "]m", move_next "@function.outer", { desc = "Next function" })
      map({ "n", "x", "o" }, "]]", move_next "@class.outer", { desc = "Next class" })
      map({ "n", "x", "o" }, "[m", move_prev "@function.outer", { desc = "Prev function" })
      map({ "n", "x", "o" }, "[[", move_prev "@class.outer", { desc = "Prev class" })
    end,
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
}
