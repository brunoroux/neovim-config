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
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" , "bashls", "dockerls", "docker_compose_language_service", "eslint", "gopls", "helm_ls", "jsonls", "tsserver", "intelephense", "jedi_language_server", "rust_analyzer", "terraformls"},
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local on_attach = function(_, _)
                vim.keymap.set('n', '<leader>bn', vim.lsp.buf.rename, { desc = 'rename' })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'code actions'})

                vim.keymap.set('n', 'cd', vim.lsp.buf.definition, { desc = 'Goto Definition'})
                vim.keymap.set('n', 'ci', vim.lsp.buf.implementation, { desc = 'Goto Implementation' })
                vim.keymap.set('n', 'cr', require('telescope.builtin').lsp_references, { desc = 'List References'})
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
            require("lspconfig").gopls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").helm_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").jsonls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").intelephense.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").jedi_language_server.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            require("lspconfig").terraformls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

        end
    },
}
