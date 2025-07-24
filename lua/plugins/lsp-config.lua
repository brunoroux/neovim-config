return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        lazy = false,
        config = function()
            local on_attach = function(_, _)
                vim.keymap.set('n', '<leader>bn', vim.lsp.buf.rename, { desc = 'rename' })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'code actions' })

                vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
                vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc = 'Goto Implementation' })
                vim.keymap.set('n', '<leader>cr', require('telescope.builtin').lsp_references, { desc = 'List References' })
                vim.keymap.set('n', '<leader>cK', vim.lsp.buf.hover, {})
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, { desc = 'References' })
                vim.keymap.set('n', '<leader>cs', function()
                    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                end, { silent = true, noremap = true, desc = 'Toggle Diagnostics' })
                -- vim.keymap.set('n', '<leader>cs', vim.lsp.bug.signature_help(), { desc = 'Signature help' })
            end

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            require("lspconfig").lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").bashls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").dockerls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").docker_compose_language_service.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").eslint.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").jsonls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").ts_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").intelephense.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").gopls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                      analyses = {
                        unusedparams = true,
                      },
                      staticcheck = true,
                      gofumpt = true,
                    },
                },
            }
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●', -- Could be '●', '▎', 'x'
                    spacing = 4,
                },
                signs = true,
                underline = false,
                severity_sort = true,
                update_in_insert = false,
            })
        end
    },
    {
        "mfussenegger/nvim-dap",
        lazy = false,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = false,
        config = function()
            vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            vim.keymap.set('n', '<F6>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F8>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toogle breakpoint" })
            vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Set breakpoint" })
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Open repl" })
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Run last" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end, { desc = "Hover widgets" })
            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end, { desc = "preview widgets" })
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end, { desc = "widgets frames" })
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end, { desc = "widgets scopes" })

            require('mason-nvim-dap').setup({
                automatic_setup = true,
                ensure_installed = { "php-debug-adapter" },
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,
                    php = function(config)
                        config.configurations = {
                            {
                                type = 'php',
                                request = 'launch',
                                name = "Listen for XDebug",
                                port = 9003,
                                log = true,
                                pathMappings = {
                                    ['/var/www/html/'] = vim.fn.getcwd() .. '/',
                                },
                                hostname = '0.0.0.0',
                            }
                        }
                        require('mason-nvim-dap').default_setup(config) -- don't forget this!
                    end,
                },
            })
        end
    }
}
