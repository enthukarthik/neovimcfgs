local o = vim.opt

o.number = true
o.relativenumber = true
o.list = true
o.listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«", eol = "¬" }

o.background = "dark"
o.termguicolors = true
o.cursorline = true

o.signcolumn = "yes"

o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true

o.ignorecase = true
o.hlsearch = false
o.smartcase = true

o.smartindent = true

o.scrolloff = 15
o.sidescrolloff = 5

o.splitright = true
o.splitbelow = true
o.swapfile = false
o.undofile = true
o.virtualedit = "block"
o.mouse = "a"
o.mousemoveevent = true

o.updatetime = 250
o.timeoutlen = 300

o.clipboard:append("unnamedplus")
o.shortmess:append("IsF")

