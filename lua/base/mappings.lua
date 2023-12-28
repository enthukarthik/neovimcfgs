local ivnoremap = require('utils.keymap').Ivnoremap
local vnoremap = require('utils.keymap').Vnoremap
local nnoremap = require('utils.keymap').Nnoremap
local tnoremap = require('utils.keymap').Tnoremap
local xnoremap = require('utils.keymap').Xnoremap

ivnoremap('jk', '<Esc>')

-- Window pane navigation
nnoremap('<C-h>','<C-w>h')
nnoremap('<C-j>','<C-w>j')
nnoremap('<C-k>','<C-w>k')
nnoremap('<C-l>','<C-w>l')

nnoremap('<leader>sv', '<C-w>v')
nnoremap('<leader>sh', '<C-w>s')
nnoremap('<leader>sx', ':close<CR>')
nnoremap('<leader>se', '<C-w>=')

-- Resize pane windows with arrow keys
nnoremap('<C-Up>', ':resize -2<CR>')
nnoremap('<C-Down>', ':resize +2<CR>')
nnoremap('<C-Right>', ':vertical resize -2<CR>')
nnoremap('<C-Left>', ':vertical resize +2<CR>')

-- Buffer navigation
nnoremap('<tab>', ':bnext<CR>')
nnoremap('<S-tab>', ':bprevious<CR>')

nnoremap('<leader>h', ':nohlsearch<CR>')

nnoremap('<leader>a', 'ggVG') -- Select all

-- Move text up or down
nnoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
nnoremap('<A-k>', '<Esc>:m .-2<CR>==gi')

-- stay in indent mode
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- move text up or down in visual mode
vnoremap('<A-j>', ':m .+1<CR>==')
vnoremap('<A-k>', ':m .-2<CR>==')

-- Better terminal navigation
tnoremap('<C-h>','<C-\\><C-n><C-w>h')
tnoremap('<C-j>','<C-\\><C-n><C-w>j')
tnoremap('<C-k>','<C-\\><C-n><C-w>k')
tnoremap('<C-l>','<C-\\><C-n><C-w>l')

-- Move text in visual block mode
xnoremap('J', ":move '>+1<CR>gv-gv")
xnoremap('<A-j>', ":move '>+1<CR>gv-gv")
xnoremap('K', ":move '<-2<CR>gv-gv")
xnoremap('<A-k>', ":move '<-2<CR>gv-gv")
