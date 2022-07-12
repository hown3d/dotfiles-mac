local opt = vim.opt
local g = vim.g

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.guifont = "Hack Nerd Font"
opt.clipboard = "unnamedplus"
opt.relativenumber = true
g.lazygit_floating_window_use_plenary = 1
-- neovide
g.neovide_remember_window_size = true
-- g.neovide_input_macos_alt_is_meta = true
g.neovide_floating_blur_amount_x = 2.0
g.neovide_floating_blur_amount_y = 2.0

--highlighting
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
