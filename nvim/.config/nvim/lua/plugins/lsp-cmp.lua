return {
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping(
                    cmp.mapping.confirm({
                        select = true,
                        behavior = cmp.ConfirmBehavior.Insert,
                    }),
                    { "i", "c" }
                    ),
                    ["<C-j>"] = cmp.mapping.select_next_item({
                        behavior = cmp.ConfirmBehavior.Insert,
                    }),
                    ["<C-k>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.ConfirmBehavior.Insert,
                    }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-5),
                    ["<C-f>"] = cmp.mapping.scroll_docs(5),
                    ["<C-q>"] = cmp.mapping.abort(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    }
}
