call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'		" Darken unfocused blocks
Plug 'terryma/vim-multiple-cursors' " Multiple Cursors
Plug 'sheerun/vim-polyglot'			" Better Syntax Highlighting
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:Hexokinase_highlighters = [ 'backgroundfull' ]
