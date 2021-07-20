" .vimrc
filetype plugin indent on
filetype plugin on

" Tab Spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Converts tabs to spaces
set expandtab
set autoindent
set fileformat=unix

" Basic Settings
    " helps vim function the same on windows
    set nocompatible
    syntax on
    set encoding=utf-8
    set number relativenumber
    " enable autocomplete ctl+n to activate
    set wildmode=longest:list,full
    " disable auto comment on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions=o
set termguicolors

set laststatus=2

autocmd StdinReadPre * let s:std_in=1

