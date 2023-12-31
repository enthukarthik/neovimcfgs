return {
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
  {
    "folke/trouble.nvim",
    event = { "BufReadPost" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = require("plugins.overrides.trouble").troublesetup,
  },
}
