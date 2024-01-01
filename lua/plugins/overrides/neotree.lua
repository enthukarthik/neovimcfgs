local M = {}

M.neotreekeymap = {
  { "<C-n>",      "<cmd>Neotree float toggle<CR>" },
  { "<leader>fr", "<cmd>Neotree float reveal<CR>" },
  { "<leader>nt", "<cmd>Neotree left toggle<CR>" },
}

M.neotreesetup = function()
  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })

  require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },
  })
end

return M
