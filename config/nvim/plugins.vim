call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter' " Find working directory automatically
Plug 'alvan/vim-closetag' " Close HTML tags automatically
Plug 'crusoexia/vim-monokai' " Color Scheme
Plug 'tpope/vim-surround' " Add surrounding via `ysiw` and remove via `ds`
Plug 'tpope/vim-sleuth' " Automatically adjust 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-vinegar' " Enhance netrw
Plug 'junegunn/limelight.vim' " Dim unfocused blocks via Space+L
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'lilydjwg/colorizer' " Color Hightlighter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-treesitter/playground' " Treesitter Playground
Plug 'mattn/emmet-vim'
call plug#end()

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Vim Rooter
let g:rooter_change_directory_for_non_project_files = 'current'
