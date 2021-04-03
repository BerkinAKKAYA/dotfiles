let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

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

" Remove Vi Compatability
set nocompatible

" Tab & Shift
set noexpandtab
set copyindent
set preserveindent
set softtabstop=4
set shiftwidth=4
set tabstop=4

" Prevent Creating Unnecessary Files
set nobackup
set nowritebackup
set noswapfile

" Highlight Searches When Typing, Hide When Stopped
set nohlsearch
set incsearch

" Leave Some Space When Scrolling
set scrolloff=2

" Allow Plugins by Filetype
filetype plugin indent on
set completeopt=longest,menuone,preview

" Enable Mouse
set mouse=a

" Miscellanious
set cmdheight=2
set updatetime=300
set shell=/bin/fish
set encoding=UTF-8
set termguicolors
set signcolumn=yes

" Restore View (Folds, Scroll Position)
autocmd BufWritePre,BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Remove Svelte Filetype and Set Syntax as JavaScript
autocmd BufNewFile,BufRead *.svelte set filetype=
autocmd BufNewFile,BufRead *.svelte set syntax=javascript
