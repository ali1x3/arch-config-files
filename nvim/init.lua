require("config.lazy")
require("config.keymaps")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set scrolloff=8")
vim.cmd("let g:db_ui_auto_execute_table_helpers = 1")
vim.cmd("set nofoldenable")
vim.diagnostic.config({ virtual_text = true })
vim.cmd("source ~/.vimrc")


local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.conceallevel = 1
