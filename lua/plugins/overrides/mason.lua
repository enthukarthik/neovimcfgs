local M = {}

M.masonsetup = function()
  require("mason").setup({
    ui = {
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = "󰚌 ",
      },
    },

    max_concurrent_installers = 10,
  })

  local srv_options = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
    },
  }

  vim.api.nvim_create_user_command("MasonInstallAll", function()
    if srv_options.ensure_installed and #srv_options.ensure_installed > 0 then
      vim.cmd("MasonInstall " .. table.concat(srv_options.ensure_installed, " "))
    end
  end, {})

  vim.g.mason_binaries_list = srv_options.ensure_installed
end

return M
