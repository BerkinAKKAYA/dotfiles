call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter' " Find working directory automatically
Plug 'alvan/vim-closetag' " Close HTML tags automatically
Plug 'crusoexia/vim-monokai' " Color Scheme
Plug 'tpope/vim-surround' " Add surrounding via `ysiw` and remove via `ds`
Plug 'tpope/vim-sleuth' " Automatically adjust 'shiftwidth' and 'expandtab'
Plug 'tpope/vim-vinegar' " Enhance netrw
Plug 'junegunn/limelight.vim' " Dim unfocused blocks via Space+L
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-treesitter/playground' " Treesitter Playground
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim' " Fuzzy Finder
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Vim Rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" FZF & Ripgrep
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files"

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

nnoremap <silent> K :call CocAction('doHover')<CR>

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
