call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Variables for plugins
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
