call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim'
Plug 'tree-sitter/tree-sitter'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth' " Indent Detector
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'
Plug 'alvan/vim-closetag'
Plug 'posva/vim-vue'
call plug#end()

" Variables for plugins
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace', 'prettier'] }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--tab-width 4 --print-width 120'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 0
let g:closetag_filenames = '*.html,*.vue'
let g:LanguageClient_serverCommands = { 'vue': ['vls'] }

function! OpenCompletion()
    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction
autocmd InsertCharPre *.{vue} call OpenCompletion()
