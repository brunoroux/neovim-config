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
            wk.register({
              f = {
                name = "file", -- optional group name
              },
              c = {
                name = "code",
              },
              b = {
                name = "buffers",
              },
              g = {
                name = "git",
              },
              d = {
                name = "debugger"
              }
            }, { prefix = "<leader>" })
        end
    }
}
