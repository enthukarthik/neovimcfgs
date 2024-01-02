return {
  {
    "nvimtools/none-ls.nvim",
    enabled = true,
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
}
