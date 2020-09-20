" .vimrc

" Vundle
" make sure Vundle stays before any other configurations
" add Vundle to the runtime path and intitialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle This needs to be before anyother plugin
Plugin 'VundleVim/Vundle.vim'

" Plugins go down here
" Keep Plugin commands between vundle#begin() and vundle$end()

" NERDTree
Plugin 'preservim/nerdtree'

" Colorizer ColorHighlight
Plugin 'chrisbra/Colorizer'

" OneDark theme
Plugin 'joshdick/onedark.vim'

" Lightline
Plugin 'itchyny/lightline.vim'

" Polyglot (languague support and syntax highlighting for ~156 languages
" inlcuding C, JS, Ruby, Python, Rust, PHP, SH, etc
Plugin 'sheerun/vim-polyglot'


" Plugins should all be above this line
call vundle#end()
filetype plugin indent on



" Tab Spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

" Lighline
set laststatus=2

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \}

" Should be last line in .vimrc
" Sets colorscheme to onedark
colorscheme onedark

" always open nerdtree when vim starts
" autocmd vimenter * NERDTree

"open nerdtree if vim starts and no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

