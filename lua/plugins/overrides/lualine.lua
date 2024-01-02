local M = {}

M.lualinesetup = function()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "gruvbox",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode", "searchcount" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 2 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location", "%b %B", "%h%m%r", "os.date()" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = { { "buffers", mode = 2 } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { require("auto-session.lib").current_session_name },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

return M
