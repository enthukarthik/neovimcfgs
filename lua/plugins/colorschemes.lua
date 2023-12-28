return {
  {
    "Shatur/neovim-ayu",
    priority = 1000,
  },
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 999,
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
    priority = 998,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "decay"
    end,
  },
  {
    "Everblush/nvim",
    name = "everblush",
    priority = 997,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 996,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 995,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 994,
  },
  {
    "tiagovla/tokyodark.nvim",
    priority = 993,
  },
  {
    "tanvirtin/monokai.nvim",
    priority = 991,
    lazy = false,
  },
}
