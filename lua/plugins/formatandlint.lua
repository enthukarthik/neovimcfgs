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
        },
      })

      nnoremap("<leader>f", "<cmd>Format<CR>")
      nnoremap("<leader>F", "<cmd>FormatWrite<CR>")
    end,
  },
}
