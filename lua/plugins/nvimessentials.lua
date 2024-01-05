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
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true,
      })

      require("utils.keymap").Inoremap("<A-i>", "<cmd>IconPickerInsert<cr>")
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      require("alpha.term")
      dashboard.section.terminal.command = vim.fn.stdpath("config") .. "/nvim-logo -t"
      dashboard.section.terminal.width = 70
      dashboard.section.terminal.height = 10
      dashboard.section.terminal.opts.redraw = true
      dashboard.section.terminal.opts.window_config.zindex = 1
      -- offset placment for screenshots
      -- dashboard.section.terminal.opts.window_config.col = math.floor((vim.o.columns - 70) / 2 + 20)
      -- vim.cmd [[autocmd! User AlphaClosed]]

      dashboard.section.buttons.val = {
        dashboard.button("i", "    new file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("o", "    old files", ":Telescope oldfiles<CR>"),
        dashboard.button("f", "󰥨    find file", ":Telescope file_browser<CR>"),
        dashboard.button("g", "󰱼    find text", ":Telescope live_grep_args<CR>"),
        dashboard.button("l", "󰒲    lazy", ":Lazy<CR>"),
        dashboard.button("m", "󱌣    mason", ":Mason<CR>"),
        dashboard.button("p", "󰄉    profile", ":Lazy profile<CR>"),
        dashboard.button("q", "󰭿    quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Normal"
        button.opts.hl_shortcut = "Function"
      end
      dashboard.section.footer.opts.hl = "Special"
      dashboard.opts.layout = {
        dashboard.section.terminal,
        { type = "padding", val = 4 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }
      return dashboard
    end,

    config = function(_, dashboard)
      -- close lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "󱐋 " .. stats.count .. " plugins loaded in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
  {
    "tris203/hawtkeys.nvim",
    enabled = false,
    config = true,
  },
  {
    "rmagatti/auto-session",
    branch = "main",
    event = "VimEnter",
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

      require("auto-session").setup({
        log_level = "error",
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = true,
        cwd_change_handling = {
          post_cwd_change_hook = function()
            require("lualine").refresh()
          end,
        },
      })
    end,
  },
}
