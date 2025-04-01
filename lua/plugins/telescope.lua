return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local builtin = require('telescope.builtin')
            local utils = require('telescope.utils')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files'})
            vim.keymap.set('n', '<leader>fd', builtin.git_files, { desc = 'Find git giles'})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep'})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers'})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags'})
            vim.keymap.set('n', '<leader>bs', builtin.grep_string, { desc = 'Grep string'})
            vim.keymap.set('n', '<leader>fr', function () builtin.find_files({ cwd = utils.buffer_dir() }) end, { desc = 'Find in current directory'})
            vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer'})

            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim'
    }
}
