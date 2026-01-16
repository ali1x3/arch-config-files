return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })
        vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = 'Telescope diagnostics' })

        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
    end,
}
