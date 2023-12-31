return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = require("plugins.overrides.neotree").neotreekeymap,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require("plugins.overrides.neotree").neotreesetup,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" }
  },
  {
    'stevearc/oil.nvim',
    keys = require("plugins.overrides.oil").oilkeymap,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
