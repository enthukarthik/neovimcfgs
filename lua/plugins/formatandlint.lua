return {
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.formatting.stylua,
      }

      null_ls.setup({
        debug = true,
        sources = sources,
      })
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- local util = require("formatter.util")
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
        },
      })

      nnoremap("<leader>f", "<cmd>Format<CR>")
      nnoremap("<leader>F", "<cmd>FormatWrite<CR>")
    end,
  },
}
