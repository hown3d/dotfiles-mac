require("go").setup({
  run_in_floaterm = true,
})
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
require('go.format').goimport()
  end,
})
