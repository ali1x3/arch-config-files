return {
    -- LSP
    -- LSP servers and clients communicate which features they support through "capabilities".
    --  By default, Neovim supports a subset of the LSP specification.
    --  With blink.cmp, Neovim has _more_ capabilities which are communicated to the LSP servers.
    --  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
    --
    -- This can vary by config, but in general for nvim-lspconfig:

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'saghen/blink.cmp',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },

        -- example using `opts` for defining servers
        opts = {
            servers = {
                lua_ls = {},
                sqlls = {single_file_support = true},
                elixir = {},
                jdtls = {},
            }
        },

        -- config = function(_, opts)
        --     local lspconfig = require('lspconfig')
        --     for server, config in pairs(opts.servers) do
        --         -- passing config.capabilities to blink.cmp merges with the capabilities in your
        --         -- `opts[server].capabilities, if you've defined it
        --         config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        --         lspconfig[server].setup(config)
        --     end
        -- end,

       -- example calling setup directly for each LSP
       config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            require('lspconfig').tinymist.setup({
                single_file_support = true,
                root_dir = require('lspconfig').util.root_pattern("typst.toml", ".git"),
                settings = {
                    exportPdf = "onSave", -- Optional: Create PDF on save
                },
                capabilities = capabilities,
            })

       --     local lspconfig = require('lspconfig')

       --     lspconfig['lua_ls'].setup({ capabilities = capabilities })
       --     lspconfig['jdtls'].setup({ capabilities = capabilities })
       --     lspconfig['sqlls'].setup({ capabilities = capabilities })
       --     lspconfig['elixirls'].setup({ capabilities = capabilities })

            require('mason-lspconfig').setup({
                ensure_installed = {'jdtls'},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({ capabilities = capabilities })
                    end,

                    -- custom handlers
                    biome = function()
                        require('lspconfig').biome.setup({
                            single_file_support = false,
                            on_attach = function(client, bufnr)
                                print('hello biome')
                            end
                        })
                    end,

                    sqlls = function()
                        require('lspconfig').sqlls.setup({
                            single_file_support = true,
                            on_attach = function(client, bufnr)
                                print('hello biome')
                            end
                        })
                    end,
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = {buffer = event.buf}

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })

       end
    }
}
