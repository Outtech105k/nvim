local v = vim

-- 各種プラグインインストール
require("lazy").setup({
    -- ファイルツリー
    "nvim-tree/nvim-tree.lua",

    -- LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    -- カラースキーム
    "vim-scripts/ScrollColors",

    -- 閉じ括弧追加
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- nvim-cmp本体と依存プラグインを追加
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',    -- LSP補完用
            'hrsh7th/cmp-buffer',      -- バッファ補完用
            'hrsh7th/cmp-path',        -- パス補完用
            'hrsh7th/cmp-cmdline',     -- コマンドライン補完用
            'L3MON4D3/LuaSnip',        -- スニペットエンジン
            'saadparwaiz1/cmp_luasnip' -- LuaSnipとの連携
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- 基本的な設定
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- LuaSnipを使用
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enterで選択
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },  -- LSPからの補完
                    { name = 'luasnip' },   -- スニペット
                }, {
                    { name = 'buffer' },    -- バッファ内のテキスト補完
                    { name = 'path' }       -- ファイルパス補完
                }),
            })

            -- `/` や `?` のコマンドライン用補完設定
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- `:` のコマンドライン用補完設定
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- 補完候補アイコン
            local lspkind = require('lspkind')
            cmp.setup {
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol', -- show only symbol annotations
                        maxwidth = {
                            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                            -- can also be a function to dynamically calculate max width such as
                            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                            menu = 50, -- leading text (labelDetails)
                            abbr = 50, -- actual suggestion item
                        },
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, vim_item)
                            return vim_item
                        end
                    })
                }
            }
        end
    },
    "onsails/lspkind.nvim"
})

require("nvim-tree").setup()

require("mason").setup()
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({})
    end,
})

