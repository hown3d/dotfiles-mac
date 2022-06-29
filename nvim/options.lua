local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.guifont="Hack Nerd Font"
opt.clipboard="unnamedplus"

--highlighting
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

