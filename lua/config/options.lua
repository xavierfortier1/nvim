vim.g.mapleader = " "

vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

vim.opt.fillchars = { eob = " " }

vim.opt.clipboard:append("unnamedplus")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 1
