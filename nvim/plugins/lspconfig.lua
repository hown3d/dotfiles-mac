local M = {}

function LineDiagnosticsHover(bufnr)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- When calling require("nvim-lsp-installer").setup {}, a hook will be registered with lspconfig.
  -- This hook will be invoked every time you set up a server.
  -- See https://github.com/williamboman/nvim-lsp-installer/discussions/636
  for _, lsp in ipairs(require("nvim-lsp-installer.servers").get_installed_server_names()) do
    local on_attach_func = function(client, bufnr)
      LineDiagnosticsHover(bufnr)
      require("lsp-format").on_attach(client)
      require("aerial").on_attach(client, bufnr)
      attach(client, bufnr)
    end

    if lsp == "sumneko_lua" then
      local luadev = vim.tbl_deep_extend('force',
        require("lua-dev").setup {
          runtime_path = true, -- enable this to get completion in require strings. Slow!
          lspconfig = {
            on_attach = on_attach_func,
            capabilities = capabilities,
          },
        }, {
        settings = {
          Lua = {
            completion = { callSnippet = "Disable" },
            workspace = { maxPreload = nil },
          },
        },
      })
      lspconfig[lsp].setup(luadev)
      goto skip
    end

    local settings = {}
    if lsp == "gopls" then
      settings = {
        gopls = {
          semanticTokens = true
        }
      }
    end

    lspconfig[lsp].setup({
      on_attach = on_attach_func,
      capabilities = capabilities,
      settings = settings,
    })

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
    ::skip::
  end
end

return M
