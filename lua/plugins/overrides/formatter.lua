local M = {}

M.formattersetup = function()
  local nnoremap = require("utils.keymap").Nnoremap

  require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,

    filetype = {
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      c = {
        require("formatter.filetypes.c").clangformat,
      },
      cpp = {
        require("formatter.filetypes.cpp").clangformat,
      },
      haskell = {
        require("formatter.filetypes.haskell").stylish_haskell(),
      },
      json = {
        require("formatter.filetypes.json").prettierd,
      },
      python = {
        require("formatter.filetypes.python").black(),
      },
      rust = {
        require("formatter.filetypes.rust").rustfmt(),
      },
      toml = {
        require("formatter.filetypes.toml").taplo(),
      },
      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace,
      },
    },
  })

  nnoremap("<leader>f", "<cmd>Format<CR>")
  nnoremap("<leader>F", "<cmd>FormatWrite<CR>")

  local formatter_grp = vim.api.nvim_create_augroup("__formatter__", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = formatter_grp,
    command = ":FormatWrite",
  })
end

return M
