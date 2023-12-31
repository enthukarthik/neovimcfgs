local M = {}

M.toggletermsetup = function()
  require("toggleterm").setup({
    open_mapping = [[<C-\>]],
    hide_number = false,
    direction = "float",
    float_opts = {
      border = "curved",
    },
  })
end

return M
