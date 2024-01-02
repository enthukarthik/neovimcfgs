return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = require("plugins.overrides.mason").masonsetup,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = require("plugins.overrides.lspconfig").lspconfigsetup,
  },
  {
    "nvimtools/none-ls.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.formatting.stylua,
      }

      null_ls.setup({
        debug = true,
        sources = sources,
      })
    end,
  },
}
