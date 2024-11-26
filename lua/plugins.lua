local v = vim
local lazypath = v.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (v.uv or v.loop).fs_stat(lazypath) then
    v.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
v.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-tree/nvim-tree.lua",

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "echasnovski/mini.completion",
    },

    "vim-scripts/ScrollColors",
    "windwp/nvim-autopairs",
})

require("nvim-tree").setup()

require("mason").setup()
require("mason-lspconfig").setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({})
    end,
})
require("mini.completion").setup()
