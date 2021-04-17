call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-rooter'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Variables for plugins
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:user_emmet_mode='a'
let g:rg_format = "%f:%l:%c:%m"
