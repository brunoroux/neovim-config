return {
    {
        'nvim-pack/nvim-spectre',
        config = function ()
            local spectre = require('spectre')
            vim.keymap.set('n', '<leader>S', spectre.toggle, { desc = 'Toggle Spectre'})

            require("spectre").setup()
        end
    },
}
