return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local linter = require("lint")

      linter.linters_by_ft = {
        c = { "clangtidy" },
        cpp = { "clangtidy" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          linter.try_lint()
        end,
      })
    end,
  },
  {
    "dense-analysis/ale",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.cmd([[
        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '▲'
        let g:ale_lint_on_save = 1
        let g:ale_lint_on_text_changed = 0
        let g:ale_lint_on_enter = 1
        let g:ale_linters = {
        \ 'rust': ['analyzer'],
        \  }
      ]])
    end,
  },
}
