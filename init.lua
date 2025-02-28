require("config.lazy")
require("config.keymaps")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set scrolloff=8")
vim.cmd("source ~/.vimrc")

local opt = vim.opt
vim.cmd[[colorscheme lushwal]]
opt.relativenumber = true
opt.number = true

