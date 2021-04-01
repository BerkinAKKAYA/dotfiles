let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" Focus on Working Directory Automatically
" set autochdir
autocmd BufEnter * silent! lcd %:p:h

" Set termguicolors
set termguicolors

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
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

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
filetype plugin indent on
set completeopt=longest,menuone,preview

" Enable Omni Completion
set omnifunc=syntaxcomplete#Complete

" Enable Mouse
set mouse=a

" Use Default Shell
set shell=/bin/fish

" Restore View (Folds, Scroll Position)
autocmd BufWritePre,BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

autocmd BufNewFile,BufRead *.svelte set filetype=
autocmd BufNewFile,BufRead *.svelte set syntax=javascript
