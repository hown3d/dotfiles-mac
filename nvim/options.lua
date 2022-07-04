local opt = vim.opt
local g = vim.g

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.guifont = "Hack Nerd Font"
opt.clipboard = "unnamedplus"
g.lazygit_floating_window_use_plenary = 1

--highlighting
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
