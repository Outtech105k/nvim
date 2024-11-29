local v = vim
local cmd = v.cmd

-- ターミナルを開いたらに常にinsertモードに入る
cmd("autocmd TermOpen * :startinsert")

-- ターミナルモードで行番号を非表示
cmd("autocmd TermOpen * setlocal norelativenumber")
cmd("autocmd TermOpen * setlocal nonumber")

