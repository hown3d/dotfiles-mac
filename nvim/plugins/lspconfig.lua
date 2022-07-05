local M = {}

local lua_library = {}
-- from https://gist.github.com/folke/fe5d28423ea5380929c3f7ce674c41d8
local function lua_settings()
  local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
      p = vim.loop.fs_realpath(p)
      lua_library[p] = true
    end
  end

  -- add runtime
  add("$VIMRUNTIME")

  -- add your config
  add("~/.config/nvim")

  -- add plugins
  -- if you're not using packer, then you might need to change the paths below
  add("~/.local/share/nvim/site/pack/packer/opt/*")
  add("~/.local/share/nvim/site/pack/packer/start/*")


  local path = vim.split(package.path, ";")

  -- this is the ONLY correct way to setup your path
  table.insert(path, "lua/?.lua")
  table.insert(path, "lua/?/init.lua")

  return {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = path
      },
      completion = { callSnippet = "Both" },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = lua_library,
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
      telemetry = { enable = false }
    },
  }
end

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"
  lspconfig

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
    local on_new_config
    if lsp == "sumneko_lua" then
      settings = lua_settings()
      on_new_config = function(config, root)
        local libs = vim.tbl_deep_extend("force", {}, lua_library)
        libs[root] = nil
        config.settings.Lua.workspace.library = libs
        return config
      end
    end

    lspconfig[lsp].setup {
      on_attach = on_attach_func,
      capabilities = capabilities,
      settings = settings,
      on_new_config = on_new_config,
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
