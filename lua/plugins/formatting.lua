return {
  -- {
  --   "nvimtools/none-ls.nvim",
  --   enabled = false,
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     local null_ls = require("null-ls")
  --
  --     local sources = {
  --       null_ls.builtins.formatting.stylua,
  --     }
  --
  --     null_ls.setup({
  --       debug = true,
  --       sources = sources,
  --     })
  --   end,
  -- },
  -- {
  --   "stevearc/conform.nvim",
  --   enabled = false,
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     local conform = require("conform")
  --     conform.setup({
  --       formatters_by_ft = {
  --         javascript = { "prettierd" },
  --         typescript = { "prettierd" },
  --         javascriptreact = { "prettierd" },
  --         typescriptreact = { "prettierd" },
  --         svelte = { "prettierd" },
  --         css = { "prettierd" },
  --         html = { "prettierd" },
  --         json = { "prettierd" },
  --         yaml = { "prettierd" },
  --         markdown = { "prettierd" },
  --         graphql = { "prettierd" },
  --         lua = { "stylua" },
  --         c = { "clang_format" },
  --         cpp = { "clang_format" },
  --         rust = { "rustfmt" },
  --         -- python = { "isort", "black" },
  --       },
  --       format_on_save = {
  --         lsp_fallback = true,
  --         async = true,
  --         timeout_ms = 500,
  --       },
  --     })
  --   end,
  -- },
  {
    "mhartington/formatter.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = require("plugins.overrides.formatter").formattersetup,
  },
}
