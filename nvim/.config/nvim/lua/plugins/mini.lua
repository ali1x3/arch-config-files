return {
    {
        'echasnovski/mini.nvim', version = false
    },
    {
        'echasnovski/mini.pairs', version = false,
        config = function ()
            require('mini.pairs').setup()

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "rust",
                callback = function()
                    vim.api.nvim_buf_set_keymap(0, "i", "'", "'", { noremap = true, silent = true })
                end,
            })
        end
    },
    {
        'echasnovski/mini.surround', version = false,
        config = function ()
            require('mini.surround').setup()
        end
    },
    {
        'echasnovski/mini.icons', version = false,
        config = function ()
            require('mini.icons').setup()
        end
    },
}

