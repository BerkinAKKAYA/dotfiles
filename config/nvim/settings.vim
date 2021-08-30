" Allow Plugins by Filetype
filetype plugin indent on

" Self Explanatory Settings
set number relativenumber
set nowrap
set clipboard=unnamed

" Fold settings
set foldmethod=indent
set foldlevel=0
set foldnestmax=8


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

" Enable Mouse
set mouse=a

" Miscellanious
set shell=/bin/fish
set encoding=UTF-8
set termguicolors
set signcolumn=no
set smartcase " Case sensitive search only if string has a capital
set autochdir

" Omni Completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noselect,noinsert

" Restore View (Folds, Scroll Position)
autocmd BufWritePre,BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
