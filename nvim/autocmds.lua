local autocmd = vim.api.nvim_create_autocmd

function ToggleTroubleAuto()
  local buftype = "quickfix"
  if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
    buftype = "loclist"
  end

  local ok, trouble = pcall(require, "trouble")
  if ok then
    vim.api.nvim_win_close(0, true)
    trouble.toggle(buftype)
  end
end

-- autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require('go.format').goimport()
--   end,
-- })

-- autocmd("QuickFixCmdPost", {
--   silent = true,
--   callback = function()
--     ToggleTroubleAuto()
--   end
-- })
