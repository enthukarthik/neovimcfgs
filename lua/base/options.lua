local options = {
  number = true,
  relativenumber = true,
  numberwidth = 2,
  list = true,
  listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«", eol = "¬" },
  showmode = false,

  cursorline = true,

  signcolumn = "yes",

  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  shiftround = true,

  ignorecase = true,
  hlsearch = true,
  smartcase = true,
  grepprg = "rg --vimgrep",
  grepformat = "%f:%l:%c:%m", -- :h errorformat

  smartindent = true,

  scrolloff = 15,
  sidescrolloff = 5,

  clipboard = "unnamed,unnamedplus",
  completeopt = "menu,menuone,noselect",
  splitright = true,
  splitbelow = true,
  swapfile = false,
  undofile = true,
  virtualedit = "block",
  mouse = "a",
  mousemoveevent = true,
  autowrite = true,
  formatoptions = "tqnlj", -- :h fo-table
  fileencoding = "utf-8",
}

vim.opt.shortmess:append("IsF")    -- :h shortmvim.opt
vim.opt.whichwrap:append("<>[]hl") -- :h whichwrap
vim.opt.iskeyword:append("-")

for key, value in pairs(options) do
  vim.opt[key] = value
end
