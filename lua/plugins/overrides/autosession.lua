local M = {}

M.autosessionsetup = function()
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
end

return M
