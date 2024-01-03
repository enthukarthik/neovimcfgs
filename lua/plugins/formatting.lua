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
    config = function()
      local nnoremap = require("utils.keymap").Nnoremap

      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,

        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          haskell = {
            require("formatter.filetypes.haskell").stylish_haskell(),
          },
          json = {
            require("formatter.filetypes.json").prettierd,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt(),
          },
          toml = {
            require("formatter.filetypes.toml").taplo(),
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })

      nnoremap("<leader>f", "<cmd>Format<CR>")
      nnoremap("<leader>F", "<cmd>FormatWrite<CR>")

      local formatter_grp = vim.api.nvim_create_augroup("__formatter__", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = formatter_grp,
        command = ":FormatWrite",
      })
    end,
  },
}
