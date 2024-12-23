local v = vim
local kmSet = v.keymap.set

-- LSPの定義ジャンプ・参照検索・情報確認
kmSet('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
kmSet('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
kmSet('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- ターミナル設定
kmSet('n', 'tt', '<cmd>terminal<CR>')
kmSet('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR>')

