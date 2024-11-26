local opt = vim.opt

-- 行番号の表示
opt.number = true
opt.relativenumber = true

-- カーソル行ハイライト
opt.cursorline = true

-- タブとインデントの設定
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- 検索設定
opt.ignorecase = true
opt.smartcase = true

-- クリップボード共有
opt.clipboard:append{'unnamedplus'}

-- 不可視文字可視化
opt.list = true
opt.listchars = { tab = '>>', trail = '-', nbsp = '+' }

