local M = {}

M.telescopesetup = function()
  local telescope = require("telescope")
  local builtins = require("telescope.builtin")
  local actions = require("telescope.actions")
  local nnoremap = require("utils.keymap").Nnoremap

  nnoremap("<leader>ff", builtins.find_files)
  nnoremap("<leader>fb", builtins.buffers)
  nnoremap("<leader>fg", builtins.live_grep)
  nnoremap("<leader>fs", builtins.grep_string)
  nnoremap("<leader>tf", ":Telescope file_browser<CR>")
  nnoremap("<leader>te", ":Telescope emoji<CR>")
  nnoremap("<leader>tg", ":Telescope glyph<CR>")
  nnoremap("<leader>tq", ":Telescope frecency<CR>")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-h>"] = actions.which_key,
          ["<leader><leader>"] = actions.close,
        },
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("frecency")
  telescope.load_extension("file_browser")
  telescope.load_extension("emoji")
  telescope.load_extension("glyph")
end

return M
