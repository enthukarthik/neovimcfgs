return {
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rt = require("rust-tools")

      rt.setup({})
    end,
  },
}
