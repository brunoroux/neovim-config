return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.phpcsfixer,
                    null_ls.builtins.formatting.yamlfmt,
                    null_ls.builtins.diagnostics.actionlint,
                    null_ls.builtins.diagnostics.yamllint,
                    null_ls.builtins.diagnostics.cfn_lint,
                },
            })

            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = 'format code'})
        end,
    },
}
