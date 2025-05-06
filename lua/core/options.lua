local g = vim.g
local opt = vim.opt
local diagnostic = vim.diagnostic

g.mapleader = " "

opt.mouse = ""
opt.mousescroll = "ver:0,hor:0"

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.wrap = false

opt.signcolumn = "yes"
opt.cursorline = true
opt.colorcolumn = "100"

opt.numberwidth = 3
opt.signcolumn = "yes:1"
opt.statuscolumn = "%l%s"
opt.fillchars = { eob = " " }

opt.cmdheight = 0
opt.shortmess:append("csCFSW")

opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
opt.foldcolumn = "0"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldnestmax = 2

opt.clipboard:append("unnamedplus")
opt.swapfile = false

diagnostic.config({
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
  signs = {
    text = vim.tbl_map(function()
      return ""
    end, diagnostic.severity),
    numhl = {
      [diagnostic.severity.WARN] = "WarningMsg",
      [diagnostic.severity.ERROR] = "ErrorMsg",
      [diagnostic.severity.INFO] = "DiagnosticInfo",
      [diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
  virtual_lines = true,
})
