local vim = vim
local opt = vim.opt

opt.updatetime = 250

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.gdefault = true

-- Edit
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.backspace = "indent,eol,start"
opt.showmatch = true
opt.matchtime = 1
opt.matchpairs:append("<:>")
opt.wildmenu = true
opt.wildignorecase = true
opt.nrformats = "alpha"
opt.completeopt = "menu,menuone,noselect"

-- Display
opt.number = true
opt.cursorline = true
opt.ruler = true
opt.list = true
opt.wrap = true
opt.breakindent = true
opt.linebreak = true
opt.pumheight = 5
opt.fillchars = "eob: "
opt.termguicolors = true
opt.pumblend = 10
opt.winblend = 15
opt.signcolumn = "yes"
opt.winborder = "rounded"

opt.whichwrap = "b,s,h,l"
opt.scrolloff = 8

-- Folding
vim.o.foldcolumn = "3"
vim.o.foldnestmax = 3
vim.o.foldlevel = 2
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

opt.swapfile = false
-- set.directory = '~/.vim/swap'
opt.backup = false
-- set.backupdir = '~/.vim/backup'
opt.undofile = false
-- set.undodir = '~/.vim/undo'

opt.clipboard = "unnamed"

opt.timeout = true
opt.timeoutlen = 800
vim.cmd("autocmd InsertLeave * set timeout timeoutlen=800")
vim.cmd("autocmd InsertEnter * set timeout timeoutlen=300")
