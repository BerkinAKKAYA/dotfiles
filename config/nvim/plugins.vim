call plug#begin('~/.vim/plugged')
Plug 'junegunn/limelight.vim' " Dim unfocused blocks via Space+L
Plug 'airblade/vim-rooter' " Find working directory automatically
Plug 'tpope/vim-surround' " Add surrounding via `ysiw` and remove via `ds`
Plug 'tpope/vim-sleuth' " Automatically adjust 'shiftwidth' and 'expandtab'
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-vinegar' " Enhance netrw
Plug 'alvan/vim-closetag' " Close HTML tags automatically
Plug 'chrisbra/Colorizer' " Highlight HEX and RGB
call plug#end()

let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='*'
