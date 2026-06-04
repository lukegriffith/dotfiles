local opt = vim.opt
local o   = vim.o

opt.number         = true
opt.relativenumber = true
opt.mouse          = 'a'
opt.showmode       = false
opt.breakindent    = true
opt.undofile       = true
opt.ignorecase     = true
opt.smartcase      = true
opt.signcolumn     = 'yes'
opt.updatetime     = 250
opt.timeout        = true
opt.timeoutlen     = 300
opt.completeopt    = 'menuone,noselect'
opt.termguicolors  = true
opt.splitbelow     = true
opt.splitright     = true
opt.list           = true
opt.listchars      = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand     = 'split'
opt.cursorline     = true
opt.scrolloff      = 10
opt.hlsearch       = true
opt.wildmenu       = true
opt.wildmode       = 'longest,list,full'
opt.showmatch      = true
opt.backspace      = 'indent,eol,start'

-- Indentation defaults (inline sleuth overrides per-buffer)
o.tabstop    = 2
o.shiftwidth = 2
opt.expandtab = true

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
