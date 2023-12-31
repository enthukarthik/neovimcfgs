return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
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
          --"stylua",
        },
      }

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if srv_options.ensure_installed and #srv_options.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(srv_options.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = srv_options.ensure_installed
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local nnoremap = require("utils.keymap").Nnoremap

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      })

      nnoremap("<leader>e", vim.diagnostic.open_float);
      nnoremap("[d", vim.diagnostic.goto_prev);
      nnoremap("]d", vim.diagnostic.goto_next);
      nnoremap("<leader>q", vim.diagnostic.setloclist);

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(args)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = args.buf }
          nnoremap('gD', vim.lsp.buf.declaration, opts)
          nnoremap('gd', vim.lsp.buf.definition, opts)
          nnoremap('K', vim.lsp.buf.hover, opts)
          nnoremap('gi', vim.lsp.buf.implementation, opts)
          nnoremap('gr', vim.lsp.buf.references, opts)
          nnoremap('<C-k>', vim.lsp.buf.signature_help, opts)
          nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          nnoremap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          nnoremap('<leader>D', vim.lsp.buf.type_definition, opts)
          nnoremap('<leader>rn', vim.lsp.buf.rename, opts)
          nnoremap('<leader>ca', vim.lsp.buf.code_action, opts)
          nnoremap('<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },
}
