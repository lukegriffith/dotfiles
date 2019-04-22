syntax enable " syntax processing
filetype plugin indent on " filetype plugins
set tabstop=2 shiftwidth=2 expandtab " tab settings
set number relativenumber " relative numbers from cursor
set autoindent " enable auto line intenting

" autocomplete
set wildmenu
set wildmode=longest,list,full

set ttymouse=xterm2 " vim mouse in tmux
set mouse=a " mouse mode
set showmatch " show matching braces
set hlsearch " highlight matches
set incsearch " search when typing starts 

" bindings
let mapleader=","

" save session, re-open with vim -S
nnoremap <leader>s :mksession<CR>

" set colour
colo desert

" show bottom menu always.
set showmode
set showcmd 

set encoding=utf-8 " use utf-8 encoding

set t_Co=256 " enable 256 colours

"set cursorline " highliht cursor 
"
" enables fuzzy search from find recursive from cwd
" :find *.go<TAB>
set path+=**

" :ls list open files
" :b <substring>
" <CTRL>n autocomplte... <CTRL>p backwards
"   exporter/gather.go
"   gf /w cursor on a filepath will move to it.
"
set paste

set splitbelow
set splitright

" Add a light grey highlight for lines that go over 80 characters.
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=81

