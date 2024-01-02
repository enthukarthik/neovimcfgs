local M = {}

local function get_options(util_options, user_options)
  local default_options = { noremap = true, silent = true }
  return vim.tbl_extend("force", default_options, util_options or {}, user_options or {})
end

local function bind(mode, util_options)
  return function(lhs, rhs, user_options)
    local combined_options = get_options(util_options, user_options)
    vim.keymap.set(mode, lhs, rhs, combined_options)
  end
end

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   terminal_mode     = "t",
--   command_mode      = "c",

M.Map = bind("n", { noremap = false })
M.AllMap = bind("")
M.Nnoremap = bind("n")
M.Inoremap = bind("i")
M.Vnoremap = bind("v")
M.Tnoremap = bind("t")
M.Xnoremap = bind("x")
M.Ivnoremap = bind({ "i", "v" })
M.Nxonoremap = bind({ "n", "x", "o" })

return M
