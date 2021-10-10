local vim = vim
local api = vim.api

vim.g.anyfold_fold_level_str = ''
vim.g.anyfold_fold_size_str = ''

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.wildmode = 'list,longest,full'
vim.o.wildmenu = true
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.mouse = 'a'
vim.o.ruler = false
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.hidden = true
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.bo.tabstop =4
vim.bo.shiftwidth = 4
vim.bo.syntax = 'on'
vim.bo.expandtab = false
vim.wo.signcolumn = 'yes:2'
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.foldmethod = 'expr'
vim.wo.foldnestmax = 10
vim.wo.foldminlines = 1
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

api.nvim_command('colorscheme nightfly')

api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
api.nvim_command("command W :execute ':w'")
api.nvim_command("command Q :execute ':q'")

api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
-- api.nvim_command('au BufWinLeave * mkview')
-- api.nvim_command('au BufWinEnter * silent! loadview')
api.nvim_command('au VimEnter * highlight HopNextKey  guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey1 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey2 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * AnyFoldActivate')


local removeBackgroundOf = { 'Normal', 'SignColumn', 'Folded', 'TabLine', 'TabLineFill', 'TabLineSel', 'MatchParen', 'Twilight' }
for _, item in ipairs(removeBackgroundOf) do
	api.nvim_command('au VimEnter * highlight ' .. item .. ' gui=NONE guibg=NONE')
end

require 'paq' {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope
	'stevearc/qf_helper.nvim';

	-- appearance
	'bluz71/vim-nightfly-guicolors';
	'kyazdani42/nvim-web-devicons';
	'morhetz/gruvbox';

	-- tools
	'blackCauldron7/surround.nvim';
	'norcalli/nvim-colorizer.lua';
	'phaazon/hop.nvim';
	'pseewald/vim-anyfold';
	'kyazdani42/nvim-tree.lua';
	'winston0410/range-highlight.nvim';
	'terrortylor/nvim-comment';
	'AckslD/nvim-neoclip.lua';
	'nvim-telescope/telescope.nvim';

	-- programming
	'folke/lsp-colors.nvim';
	'onsails/lspkind-nvim'; -- glyphs
	'nvim-treesitter/nvim-treesitter';
	'windwp/nvim-ts-autotag';
	'neovim/nvim-lspconfig';
}

-- Setup LSP
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls', 'vuels' }
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup{}
end

require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop.highlight').insert_highlights()
require('lsp-colors').setup({
	Error = '#db4b4b',
	Warning = '#e0af68',
	Information = '#0db9d7',
	Hint = '#10B981'
})
require('lspkind').init()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim-ts-autotag').setup()
require('nvim_comment').setup()
require('nvim-tree').setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	auto_close = true,
	open_on_tab = true,
	hijack_cursor = true,
	update_cwd = true,
	lsp_diagnostics = true,
	update_to_buf_dir = { enable = true, auto_open = true },
	update_focused_file = { enable = true, update_cwd  = true },
	view = { auto_resize = true }
})
require('qf_helper').setup()
require('neoclip').setup()
require('telescope').setup()

api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'F', ':HopWord<CR>', {})
api.nvim_set_keymap('n', '<C-i>', ':NvimTreeToggle<CR>', {})
api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', {})
api.nvim_set_keymap('n', '<C-p>', ':Telescope neoclip star<CR>', {})

-- Prevent focusing LSP floating window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })
