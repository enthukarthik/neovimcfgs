local M = {}

M.treesittersetup = function()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    require("nvim-treesitter.install").compilers = { "clang" }
  end
  local tsconfigs = require("nvim-treesitter.configs")
  local tstorepeatmove = require("nvim-treesitter.textobjects.repeatable_move")
  local nxonoremap = require("utils.keymap").Nxonoremap

  tsconfigs.setup({
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "cpp",
      "haskell",
      "haskell_persistent",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "toml",
    },

    auto_install = true,

    highlight = { enable = true },

    indent = { enable = true },

    textobjects = {
      -- text object selection
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- ["af"] = "@function.outer",
          -- ["if"] = "@function.inner",
          -- ["ac"] = "@class.outer",
          -- ["ic"] = { query = "@class.inner", desc = "Select inner part of the class region" },
          -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- v is charwise, V is linewise, <C-v> is blockwise
          ["@function.outer"] = "v",
          ["@class.outer"] = "v",
        },
        include_surrounding_whitespace = true,
      },

      -- swap function params and arguments
      -- swap = {
      --   enable = true,
      --   swap_next = { ["<leader>ns"] = "@parameter.inner" },
      --   swap_previous = { ["<leader>ps"] = "@parameter.inner" },
      -- },
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>is", -- set to 'false' to disable one of the mappings
        node_incremental = "<leader>ni",
        node_decremental = "<leader>nd",
        scope_incremental = false,
      },
    },

    nxonoremap(";", tstorepeatmove.repeat_last_move_next),
    nxonoremap(",", tstorepeatmove.repeat_last_move_previous),
    nxonoremap("f", tstorepeatmove.builtin_f),
    nxonoremap("F", tstorepeatmove.builtin_F),
    nxonoremap("t", tstorepeatmove.builtin_t),
    nxonoremap("T", tstorepeatmove.builtin_T),
  })
end

return M
