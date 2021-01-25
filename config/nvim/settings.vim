" Focus on Working Directory Automatically
set autochdir

" Disable Read-Only Mode No Matter What
set noro

" Self Explanatory Settings
set number relativenumber
set nowrap
set clipboard=unnamed,unnamedplus

" Ignore case when searching
set ignorecase
set smartcase

" Fold settings
set foldmethod=indent
set foldlevel=0
set foldnestmax=4

" Set Encoding
set encoding=UTF-8

" Remove Vi Compatability
set nocompatible

" Tab & Shift
set tabstop=4
set shiftwidth=4
set noexpandtab

" Prevent Creating Unnecessary Files
set nobackup
set nowritebackup
set noswapfile

" Don't highlight searchs
set nohlsearch

" Highlight while typing
set incsearch

" Leave Some Space When Scrolling
set scrolloff=2

" Allow Plugins by Filetype
filetype on

" Enable Mouse
set mouse=a

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" Use Default Shell
set shell=/bin/fish
