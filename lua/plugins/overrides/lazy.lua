local M = {}

M.specs = {
  { import = "plugins" }
}

M.lazy_opts = {
  defaults = {
    lazy = true, -- let all the plugins be lazy loaded by default
    version = "*", -- install the latest stable version of all the plugins
  },
  install = {
    colorscheme = { "decay" },
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

return M
