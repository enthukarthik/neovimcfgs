local M = {}

M.iconpickersetup = function()
  require("icon-picker").setup({
    disable_legacy_commands = true,
  })

  require("utils.keymap").Inoremap("<A-i>", "<cmd>IconPickerInsert<cr>")
end

return M
