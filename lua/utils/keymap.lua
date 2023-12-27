local M = {}

M.Map = function(mode, lhs, rhs, user_options)
  local options = { noremap = true, silent = true }
  if user_options then
    options = vim.tbl_extend("force", options, user_options) -- "force" will take rightmost table, here it's user_options
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
