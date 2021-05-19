source ~/.config/nvim/keys.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/styles.vim
source ~/.config/nvim/gruvbox.vim

hi ALEErrorSign guibg=NONE guifg=red
hi ALEWarningSign guibg=NONE guifg=yellow

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
" packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" silent! helptags ALL
