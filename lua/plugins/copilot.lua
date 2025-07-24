return {
--    {
--        'github/copilot.vim',
--    },
--     {
--         "CopilotC-Nvim/CopilotChat.nvim",
--         lazy = false,
--         dependencies = {
--           { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
--           { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
--         },
--         build = "make tiktoken", -- Only on MacOS or Linux
--         opts = {
--           -- See Configuration section for options
--         },
--         config = function()
--             require('CopilotChat').setup()
--             vim.keymap.set('n', '<leader>zo', ':CopilotChatOpen<CR>', { desc = 'open', noremap = true, silent = true })
--             vim.keymap.set('n', '<leader>zc', ':CopilotChatClose<CR>', { desc = 'close', noremap = true, silent = true })
--         end
--     }
      {
          'zbirenbaum/copilot.lua',
          event = "InsertEnter",
            keys = {
              {
                "<C-a>",
                function()
                  require("copilot.suggestion").accept()
                end,
                desc = "Copilot: Accept suggestion",
                mode = { "i" },
              },
              {
                "<C-x>",
                function()
                  require("copilot.suggestion").dismiss()
                end,
                desc = "Copilot: Dismiss suggestion",
                mode = { "i" },
              },
              {
                "<C-\\>",
                function()
                  require("copilot.panel").open()
                end,
                desc = "Copilot: Show panel",
                mode = { "n", "i" },
              },
            },
            config = function()
                require("copilot").setup()
            end,
--            init = function()
--              on.create_user_command("Copilot", "Toggle Copilot suggestions", function()
--                require("copilot.suggestion").toggle_auto_trigger()
--              end)
--            end,
            opts = {
              panel = { enabled = false },
              suggestion = {
                enabled = false,
              },
            },
      },
      {
        "giuxtaposition/blink-cmp-copilot",
      }
}
