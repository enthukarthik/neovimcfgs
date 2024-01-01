return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  {
    "kdheepak/lazygit.nvim",
    keys = require("plugins.overrides.lazygit").lazygitkeymap,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = require("plugins.overrides.lazygit").lazygitsetup,
  },
  {
    "akinsho/toggleterm.nvim",
    keys = require("plugins.overrides.toggleterm").toggletermkeymap,
    version = "*",
    config = require("plugins.overrides.toggleterm").toggletermsetup,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins.overrides.lualine").lualinesetup,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
}
