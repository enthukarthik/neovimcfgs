return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    -- event = "BufReadPost",
    lazy = false,
    opts = {},
  },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {},
  },
  {
    "ziontee113/icon-picker.nvim",
    event = "InsertEnter",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    config = require("plugins.overrides.iconpicker").iconpickersetup,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.overrides.alpha").alphaoptions,
    config = require("plugins.overrides.alpha").alphasetup,
  },
  {
    "rmagatti/auto-session",
    branch = "main",
    event = "VimEnter",
    config = require("plugins.overrides.autosession").autosessionsetup,
  },
}
