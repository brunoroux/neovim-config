require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" , "snyk_ls", "bashls", "dockerls", "docker_compose_language_service", "eslint", "gopls", "helm_ls", "jsonls", "tsserver", "intelephense", "jedi_language_server", "rust_analyzer", "terraformls"},
    automatic_installation = true,
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").snyk_ls.setup {
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
