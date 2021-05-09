call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'
Plug 'tree-sitter/tree-sitter'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
call plug#end()

" Variables for plugins
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
