-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require("haskell-tools")
local nnoremap = require("utils.keymap").Nnoremap
local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
nnoremap("<space>cl", vim.lsp.codelens.run, opts)

-- Hoogle search for the type signature of the definition under the cursor
nnoremap("<space>hs", ht.hoogle.hoogle_signature, opts)

-- Evaluate all code snippets
nnoremap("<space>he", ht.lsp.buf_eval_all, opts)

-- Toggle a GHCi repl for the current package
nnoremap("<leader>hr", ht.repl.toggle, opts)

-- Toggle a GHCi repl for the current buffer
nnoremap("<leader>rt", function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)

nnoremap("<leader>rq", ht.repl.quit, opts)
