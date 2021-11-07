require('settings')
require('mappings')
require('plugins')

vim.api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
vim.api.nvim_command("command W :execute ':w'")
vim.api.nvim_command("command Q :execute ':q'")

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
vim.api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
vim.api.nvim_command('au BufWinLeave * mkview')
vim.api.nvim_command('au BufWinEnter * silent! loadview')
vim.api.nvim_command('au BufWritePre *.* lua vim.lsp.buf.formatting_sync(nil, 200)')
