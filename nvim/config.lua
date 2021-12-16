-- general
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

lvim.leader = ";"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<D-v>"] = "a<C-r>+<Esc>"
lvim.keys.insert_mode["<D-v>"] = "<C-r>+"
lvim.keys.command_mode["<D-v>"] = "<C-r>+"
-- Move keymaps
--º = <A-j>
--∆ = <A-k>
lvim.keys.visual_mode["º"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["∆"] = ":m '<-2<CR>gv=gv"
lvim.keys.normal_mode["º"] = ":m .+1<CR>=="
lvim.keys.normal_mode["∆"] = ":m .-2<CR>=="
lvim.keys.insert_mode["º"] = "<Esc>:m .+1<CR>==gi"
lvim.keys.insert_mode["∆"] = "<Esc>:m .-2<CR>==gi"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- set keymap with custom opts
-- lvim.keys.insert_mode["po"] = {'<ESC>', { noremap = true }}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["lS"] = { "<cmd>SymbolsOutline<CR>", "Symbols"}
lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm<CR>", "Terminal"}


-- Configure builtin plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }

-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false
vim.g.relativenumber = true

-- Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
 -- local formatters = require "lvim.lsp.null-ls.formatters"
 -- formatters.setup {
 --    {
 --    exe = "goimports",
 --    filetypes = {"go"},
 --  },
 -- }

-- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   -- { exe = "black" },
-- }


-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "BufRead"
    },
  {"rcarriga/nvim-dap-ui"},
  {"ray-x/go.nvim"},
  {"simrat39/symbols-outline.nvim"},
}

vim.g.symbols_outline = {
    width = 50,
}

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

require('go').setup()

  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end

vim.api.nvim_command("au BufWritePre *.go lua goimports(1000)")
