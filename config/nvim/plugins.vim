call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-rooter'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'BrandonRoehl/auto-omni'
call plug#end()

" Variables for plugins
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:rg_format = "%f:%l:%c:%m"
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<tab>'
let g:buftabline_show=1

" Settings for Omnicomplete
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
set completeopt=noinsert,menuone,longest
