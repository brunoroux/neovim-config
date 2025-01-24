return {
    {
        'github/copilot.vim',
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = false,
        dependencies = {
          { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
          { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
          -- See Configuration section for options
        },
        config = function()
            require('CopilotChat').setup()
            vim.keymap.set('n', '<leader>zo', ':CopilotChatOpen<CR>', { desc = 'open', noremap = true, silent = true })
            vim.keymap.set('n', '<leader>zc', ':CopilotChatClose<CR>', { desc = 'close', noremap = true, silent = true })
        end
    }
}
