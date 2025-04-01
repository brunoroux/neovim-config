return {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require("cmp")

            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                  end,
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                  }, {
                    { name = 'buffer' },
                })
            })
        end
    },
    {
    	"L3MON4D3/LuaSnip",
    	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	    build = "make install_jsregexp"
    },
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
}
