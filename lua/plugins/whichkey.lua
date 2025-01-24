return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = { },
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>b", group = "buffers" },
                { "<leader>c", group = "code" },
                { "<leader>d", group = "debugger" },
                { "<leader>f", group = "file" },
                { "<leader>g", group = "git" },
                { "<leader>S", group = "Spectre" },

            })
        end
    }
}
