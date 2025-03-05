local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })

vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
