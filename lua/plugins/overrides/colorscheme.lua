vim.opt.background = "dark"
vim.opt.termguicolors = true

local colorscheme = "gruvbox"

local function setcolorscheme(scheme)
  return vim.cmd.colorscheme(scheme)
end

local status_ok, _ = pcall(setcolorscheme, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
