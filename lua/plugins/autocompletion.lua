return {
  { "hrsh7th/nvim-cmp", event = "VeryLazy", config = require("plugins.overrides.autocompletion").cmpsetup,  },
  { "hrsh7th/cmp-buffer", event = "VeryLazy", },
  { "hrsh7th/cmp-path", event = "VeryLazy", },
  { "hrsh7th/cmp-cmdline", event = "VeryLazy", },
  { "saadparwaiz1/cmp_luasnip", event = "VeryLazy", },
}
