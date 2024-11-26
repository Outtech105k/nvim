local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 行移動
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', 'gj', 'j', opts)
map('n', 'gk', 'k', opts)


vim.keymap.set('n', 'gd', '<cmd>:lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<cmd>:lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gh', '<cmd>:lua vim.lsp.buf.hover()<CR>')

