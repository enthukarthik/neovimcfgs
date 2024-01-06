return {
  -- {
  --   "mfussenegger/nvim-lint",
  --   enabled = false,
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     local linter = require("lint")
  --
  --     linter.linters_by_ft = {
  --       c = { "clangtidy" },
  --       cpp = { "clangtidy" },
  --     }
  --
  --     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  --     vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  --       group = lint_augroup,
  --       callback = function()
  --         linter.try_lint()
  --       end,
  --     })
  --   end,
  -- },
  {
    "dense-analysis/ale",
    event = { "BufReadPost", "BufNewFile" },
    config = require("plugins.overrides.ale").alesetup,
  },
}
