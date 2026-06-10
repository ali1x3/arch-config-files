vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")


vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

-- Better up/down for wrapped lines of prose
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

-- Navigate to the visual start/end of wrapped lines
vim.keymap.set({ "n", "v" }, "$", "g$", { silent = true, desc = "Visual end of line" })
vim.keymap.set({ "n", "v" }, "^", "g^", { silent = true, desc = "Visual start of text" })

-- (Optional but highly recommended) Also remap '0' so it behaves visually too
vim.keymap.set({ "n", "v" }, "0", "g0", { silent = true, desc = "Visual start of line (absolute)" })

-- allows me to copy things to my clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("v", "A", ":norm A")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>")
