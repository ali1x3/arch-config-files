return {
    {
        'echasnovski/mini.nvim', version = false
    },
    {
        'echasnovski/mini.pairs', version = false,
        config = function ()
            require('mini.pairs').setup()
        end
    },
    {
        'echasnovski/mini.icons', version = false,
        config = function ()
            require('mini.icons').setup()
        end
    },
}

