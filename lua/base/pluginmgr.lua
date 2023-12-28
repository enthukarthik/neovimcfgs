local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins_directory = {
  { import = "plugins" }
}

local lazy_opts = {
  defaults = {
    lazy = true, -- let all the plugins be lazy loaded by default
    version = "*", -- install the latest stable version of all the plugins
  },
  install = {
    colorscheme = { "monokai_pro" },
  },
  ui = {
    icons = {
      ft = " ",
      lazy = "󰂠 ",
      loaded = " ",
      not_loaded = " ",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "matchparen",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
}

require("lazy").setup(plugins_directory, lazy_opts)
