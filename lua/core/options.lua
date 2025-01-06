local v = vim
local opt = v.opt
local cmd = v.cmd

-- 文字列の折り返しをしない
opt.wrap = false

-- 行番号の表示(相対表示あり)
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

-- カラースキーム
cmd[[colorscheme sorbet]]

-- OS別にシェルを設定(デバッグ用メッセージ出力含む)
local osName = v.loop.os_uname().sysname
if osName == "Windows_NT" then
    v.api.nvim_out_write("Hello Windows_NT Nvim!\n")
    v.opt.shell = "powershell.exe"
elseif osName == "Linux" then
    v.api.nvim_out_write("Hello Linux Nvim!\n")
    v.opt.shell = "bash"
elseif osName == "Darwin" then
    v.api.nvim_out_write("Hello macOS Nvim!\n")
    v.opt.shell = "zsh"
else
    v.api.nvim_out_write("Hello Nvim!\nUnknown OS\n")
    v.opt.shell = "bash"
end

