local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.ruler = true
--opt.colorcolumn = "80"

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.autoindent = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.showmatch = true

opt.wrap = false

opt.compatible = false

opt.clipboard:append("unnamedplus")

opt.termguicolors = true
opt.signcolumn = "yes"

opt.list = true
opt.listchars = { trail = '·', extends = '>'}
