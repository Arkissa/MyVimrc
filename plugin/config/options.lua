local opt = vim.opt
local k = vim.keycode
local g = vim.g

opt.number = true
opt.filetype.plugin = true
opt.filetype.indent = true
opt.autoindent = true
opt.smartindent = true
opt.undofile = true
opt.ruler = false
opt.cursorline = true
opt.autowrite = true
opt.fillchars = {
	fold = "-",
	eob = " ",
	lastline = "@",
}
opt.list = true
opt.showbreak = "↪ "
opt.listchars = {
	tab = '» ',
	precedes = "«",
}
opt.shiftwidth = 4
opt.softtabstop = 4
opt.signcolumn = "yes"
opt.tabstop = 4
opt.scrolloff = 60
opt.laststatus = 3
opt.smartcase = true
opt.ignorecase = true
opt.wildmenu = true
opt.mouse = ""
opt.shortmess:append "c"
vim.fn.matchadd("Search", [[\s\+$]])

g.mapleader = k'<SPACE>'
