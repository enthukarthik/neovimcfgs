local M = {}

M.lazygitkeymap = {
  { "<leader>lg", "<cmd>LazyGit<CR>"},
}

M.lazygitsetup = function()
  require("telescope").load_extension("lazygit")
end

return M
