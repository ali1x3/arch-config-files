return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'saghen/blink.cmp',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },

        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- ==========================================
            -- 1. NIX-MANAGED LSPs & CUSTOM SERVERS
            -- ==========================================
            
            -- Setup nixd
            -- 1. Define your list of standard servers
            local standard_servers = {
                'nixd',
                'intelephense',
                'cssls',
                'html',
                'ts_ls'
            }

            -- 2. Loop through and attach them natively
            for _, server in ipairs(standard_servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities
                })
                vim.lsp.enable(server)
            end

            -- Setup tinymist (Using the new 0.11 `root_markers` API)
            vim.lsp.config('tinymist', {
                capabilities = capabilities,
                single_file_support = true,
                root_markers = { "typst.toml", ".git" }, -- Native replacement for util.root_pattern
                settings = {
                    exportPdf = "onSave", 
                },
            })
            vim.lsp.enable('tinymist')

            -- Setup sqls (Relies on .sqls.yml for credentials)
            vim.lsp.config('sqls', {
                capabilities = capabilities,
                root_markers = { ".sqls.yml", "devenv.nix" }, -- Native replacement for util.root_pattern
                settings = {
                    sqls = {
                        connections = {
                            {
                                driver = 'mysql',
                                dataSourceName = 'app:app@tcp(127.0.0.1:3306)/app',
                            },
                        },
                    },
                },
                handlers = {
                    ["window/showMessage"] = function(err, result, ctx, config)
                        -- Intercept and drop the fake startup error
                        if result and result.message and result.message:match("no database connection") then
                            return
                        end
                        vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
                    end,
                },
            })
            vim.lsp.enable('sqls')


            -- ==========================================
            -- 2. MASON-MANAGED LSPs
            -- ==========================================
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        -- The native 0.11 API dynamically configuring all your web dev LSPs
                        vim.lsp.config(server_name, { capabilities = capabilities })
                        vim.lsp.enable(server_name)
                    end,
                },
            })


            -- ==========================================
            -- 3. KEYBINDINGS
            -- ==========================================
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
