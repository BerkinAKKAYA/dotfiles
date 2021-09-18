call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter' " Find working directory automatically
Plug 'alvan/vim-closetag' " Close HTML tags automatically
Plug 'tpope/vim-surround' " Add surrounding via `ysiw` and remove via `ds`
Plug 'tpope/vim-sleuth' " Automatically adjust 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-vinegar' " Enhance netrw
Plug 'junegunn/limelight.vim' " Dim unfocused blocks via Space+L
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim' " Fuzzy Finder
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-treesitter/playground' " Treesitter Playground
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mangeshrex/uwu.vim'
Plug 'posva/vim-vue'
call plug#end()

" Vim Rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" FZF & Ripgrep
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files"

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
