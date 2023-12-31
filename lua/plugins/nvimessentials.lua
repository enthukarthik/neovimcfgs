return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
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
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = require("plugins.overrides.lualine").lualinesetup,
  },
  {
    -- gcc - to add a linewise comment
    -- gbc - to add blockwise comment
    -- gc - same as gcc in visual mode
    -- gb - same as gbc in visual mode
    -- gcO - add line comment above and enter Insert mode
    -- gco - add line comment below and enter Insert mode
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    -- Usage :
    -- ys{motion}{char} - add
    -- ds{char} - delete
    -- cs{target}{replacement} - change
    --     Old text                    Command         New text
    -- --------------------------------------------------------------------------------
    --     surr*ound_words             ysw)           (surround_words)
    --     *make strings               ys$"            "make strings"
    --     [delete ar*ound me!]        ds]             delete around me!
    --     remove <b>HTML t*ags</b>    dst             remove HTML tags
    --     delete(functi*on calls)     dsf             function calls
    --     'change quot*es'            cs'"            "change quotes"
    --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --     Detailed information on how to use this plugin can be found in :h nvim-surround.usage
    "kylechui/nvim-surround",
    version = "*",
    event = "InsertEnter",
    opts = {},
  },
}
