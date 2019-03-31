syntax enable " syntax processing
filetype plugin indent on " filetype plugins
set tabstop=2 shiftwidth=2 expandtab " tab settings
set number relativenumber " relative numbers from cursor
set autoindent " enable auto line intenting
set wrap linebreak nolist

" autocomplete
set wildmenu
set wildmode=longest,list,full

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
