local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- Code Actions
    code_actions.gitsigns,
    -- code_actions.refactoring,
    code_actions.shellcheck,
    -- Diagnostics
    diagnostics.actionlint,
    diagnostics.ansiblelint,
    diagnostics.buf,
    diagnostics.cfn_lint,
    diagnostics.checkmake,
    diagnostics.flake8,
    diagnostics.golangci_lint,
    diagnostics.hadolint,
    diagnostics.mypy,
    diagnostics.shellcheck,
    -- Formatters
    formatting.buf,
    formatting.shellharden,
    formatting.shfmt,
  },
})
