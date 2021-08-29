let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" Self Explanatory Settings
set number relativenumber
set nowrap
set clipboard^=unnamed
set clipboard^=unnamedplus

" Ignore case when searching
set ignorecase
set smartcase

" Fold settings
set foldmethod=indent
set foldlevel=0
set foldnestmax=8

" Remove Vi Compatability
set nocompatible

" Tab & Shift
set noexpandtab
set copyindent
" set preserveindent
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

" Enable Mouse
set mouse=a

" Miscellanious
set shell=/bin/fish
set encoding=UTF-8
set termguicolors
set signcolumn=no

" Omni Completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noselect,noinsert

" Restore View (Folds, Scroll Position)
autocmd BufWritePre,BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
