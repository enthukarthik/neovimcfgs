local M = {}

M.toggletermkeymap = {
  { "<C-\\>", "<cmd>ToggleTerm<CR>" },
  { "<leader>tr", "<cmd>ToggleTerm direction=vertical size=120<CR>" },
}

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
