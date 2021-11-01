require 'base'

opt.cursorline = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.background = 'dark'
opt.ignorecase = true
opt.completeopt = 'menuone,noselect,preview'
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.hlsearch = false
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hidden = true
opt.breakindent = true
opt.cmdheight = 1
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin indent on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }
g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }


cmd[[filetype plugin indent on]]
