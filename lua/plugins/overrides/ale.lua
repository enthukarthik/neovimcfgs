local M = {}

M.alesetup = function()
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
end

return M
