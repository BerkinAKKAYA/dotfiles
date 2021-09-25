" Allow Plugins by Filetype
filetype plugin indent on

" Self Explanatory Settings
set number relativenumber
set nowrap
set clipboard+=unnamed
set clipboard+=unnamedplus

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
set smartcase
set ignorecase
set autochdir
set updatetime=1000 " For CursorHold

" Omni Completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noselect,noinsert

set cmdheight=2
set shortmess+=c

" Restore View (Folds, Scroll Position)
autocmd BufWritePre,BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview