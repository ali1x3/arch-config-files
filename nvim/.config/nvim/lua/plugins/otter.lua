return {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    config = function(_, opts)
        local otter = require('otter')
        otter.setup(opts) -- Initialize with your opts above

        -- Create the trigger for PHP files
        -- Add more filetypes to the pattern list
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "php", "markdown", "javascript", "html" }, 
            callback = function()
                -- These are the languages Otter should look for INSIDE those files
                otter.activate({ 'php', 'html', 'css', 'javascript', 'sql' }, true, true, nil)
            end,
        })
    end
}
