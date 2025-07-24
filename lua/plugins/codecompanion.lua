return {
    {
      "olimorris/codecompanion.nvim",
      opts = {},
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("codecompanion").setup({
          strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
            cmd = {
                adapter = "copilot",
            },
          },
        })
        vim.keymap.set('n', '<leader>zo', ':CodeCompanionChat<CR>', { desc = 'Open Code Companion' })
        vim.keymap.set('n', '<leader>zp', ':CodeCompanionActions<CR>', { desc = 'Code Companion Actions' })
      end
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    },
    {
      "echasnovski/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          -- Disabled by default
          source = diff.gen_source.none(),
        })
      end,
    },
}
