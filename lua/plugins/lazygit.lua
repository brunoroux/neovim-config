return {
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'LazyGit'})
            vim.g.lazygit_floating_window_use_plenary = 1
        end
    },
}
