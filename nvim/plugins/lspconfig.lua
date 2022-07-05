local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- When calling require("nvim-lsp-installer").setup {}, a hook will be registered with lspconfig.
  -- This hook will be invoked every time you set up a server.
  -- See https://github.com/williamboman/nvim-lsp-installer/discussions/636
  for _, lsp in ipairs(require("nvim-lsp-installer.servers").get_installed_server_names()) do
    local on_attach_func = function(client, bufnr)
      -- change gopls server capabilities
      if lsp == "gopls" then
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
      end
      attach(client, bufnr)
    end

    local settings = {}
    if lsp == "sumneko_lua" then
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      }
    end


    lspconfig[lsp].setup {
      on_attach = on_attach_func,
      capabilities = capabilities,
      settings = settings
    }

    if lsp == "rust_analyzer" then
      local rust_opts = {
        tools = {
          executor = require("rust-tools/executors").quickfix
        },
        inlay_hints = {
          show_variable_name = true
        },
        server = {
          on_attach = on_attach_func,
          capabilities = capabilities,
        }
      }
      require("rust-tools").setup(rust_opts)
    end
  end
end

return M
