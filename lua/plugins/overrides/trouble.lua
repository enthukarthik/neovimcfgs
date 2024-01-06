local M = {}

M.troublesetup = function()
  local nnoremap = require("utils.keymap").Nnoremap

  nnoremap("<leader>xx", function()
    require("trouble").toggle()
  end)
  nnoremap("<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end)
  nnoremap("<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
  end)
  nnoremap("<leader>xq", function()
    require("trouble").toggle("quickfix")
  end)
  nnoremap("<leader>xl", function()
    require("trouble").toggle("loclist")
  end)
  nnoremap("gR", function()
    require("trouble").toggle("lsp_references")
  end)
end

return M
