local map = vim.api.nvim_set_keymap
local coq = require("coq")

vim.g.gitblame_date_format = '%r'
vim.g.material_style       = "deep ocean"
vim.g.closetag_filenames   = '*.html,*.blade.php,*.vue'
vim.o.completeopt          = 'menuone,noinsert,noselect'
vim.o.wildmode             = 'list,longest,full'
vim.o.wildmenu             = true
vim.o.clipboard            = 'unnamedplus'
vim.o.termguicolors        = true
vim.o.laststatus           = 0
vim.o.mouse                = 'a'
vim.o.ruler                = false
vim.o.showmode             = false
vim.o.ignorecase           = true
vim.o.updatetime           = 250
vim.o.hidden               = true
vim.o.showcmd              = false
vim.o.scrolloff            = 3
vim.o.lazyredraw           = true
vim.bo.tabstop             = 4
vim.bo.softtabstop         = 4
vim.bo.shiftwidth          = 4
vim.bo.expandtab           = false
vim.bo.syntax              = 'on'
vim.wo.signcolumn          = 'yes:1'
vim.wo.cursorline          = true
vim.wo.number              = true
vim.wo.relativenumber      = true
vim.wo.wrap                = false
vim.wo.foldexpr            = 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod          = 'expr'
vim.wo.foldnestmax         = 10
vim.wo.foldminlines        = 1
vim.opt.foldtext           = 'v:lua.custom_fold_text()'
vim.opt.fillchars          = { fold = " ", eob = " ", vert = "|", msgsep = " " }

vim.cmd 'colorscheme material'

require 'paq' {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope

	-- appearance
	'marko-cerovac/material.nvim';
	'kyazdani42/nvim-web-devicons';

	-- tools
	'blackCauldron7/surround.nvim';
	'norcalli/nvim-colorizer.lua';
	'phaazon/hop.nvim';
	'winston0410/range-highlight.nvim';
	'terrortylor/nvim-comment';
	'nvim-telescope/telescope.nvim';
	'airblade/vim-rooter';
	'lumiliet/vim-twig'; -- autoindent
	'jiangmiao/auto-pairs';
	'alvan/vim-closetag';
	'godlygeek/tabular';

	-- programming
	'nvim-treesitter/nvim-treesitter';
	'neovim/nvim-lspconfig';
	'ms-jpq/coq_nvim';
	'ms-jpq/coq.artifacts';
	-- 'L3MON4D3/LuaSnip';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

-- plugins
map('n', 'F', ':HopWord<CR>', {})
map('n', '<C-f>', ':Telescope find_files<CR>', {})

-- clear highlights
map('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

-- find and replace
map('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', 'cn', '*``cgn', {})
map('n', 'cN', '*``cgN', {})

-- lsp
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
map('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })

-- keep cursor at the center of the screen while searching and joining
map('n', 'n', 'nzzzv', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true })
map('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- undo breakpoints
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', '!', '!<c-g>u', { noremap = true, silent = true })
map('i', '?', '?<c-g>u', { noremap = true, silent = true })

-- jumplist mutations
map('n', 'k', "v:count > 5 ? \"m'\" . v:count . 'k' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count > 5 ? \"m'\" . v:count . 'j' : 'j'", { noremap = true, expr = true, silent = true })

-- move lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map('i', '<C-j>', "<esc>:m .+1<CR>i", { noremap = true, silent = true })
map('i', '<C-k>', "<esc>:m .-2<CR>i", { noremap = true, silent = true })

--ctrl+hjkl to navigate splits
map("n", "<c-k>", "<cmd>wincmd k<CR>", { noremap = true })
map("n", "<c-j>", "<cmd>wincmd j<CR>", { noremap = true })
map("n", "<c-h>", "<cmd>wincmd h<CR>", { noremap = true })
map("n", "<c-l>", "<cmd>wincmd l<CR>", { noremap = true })

vim.api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
vim.api.nvim_command("command W :execute ':w'")
vim.api.nvim_command("command Q :execute ':q'")

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
vim.api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
vim.api.nvim_command('au BufWinLeave * silent! mkview')
vim.api.nvim_command('au BufWinEnter * silent! loadview')
vim.api.nvim_command('au BufWritePre *.* silent! lua vim.lsp.buf.formatting_sync(nil, 200)')
vim.api.nvim_command('au BufWinEnter *.blade.php set filetype=vue')
vim.api.nvim_command('au BufWinEnter *.* silent! :COQnow --shut-up')

-- setup lsp
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities())
end
-- setup volar for vue seperately
require('lspconfig').volar.setup(coq.lsp_ensure_capabilities({
	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}))

-- setup plugins
require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop').setup()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('telescope').setup()
require('gitsigns').setup({
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '+', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
	},
	preview_config = {
		border   = 'single',
		style    = 'minimal',
		relative = 'cursor',
		row      = 0,
		col      = 1
	},
})
require('material').setup({
	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders  = false, -- Enable borders between verticaly split windows

	popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

	italics = {
		comments  = true, -- Enable italic comments
		keywords  = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings   = true, -- Enable italic strings
		variables = true -- Enable italic variables
	},

	text_contrast = {
		lighter = true, -- Enable higher contrast text for lighter style
		darker  = true -- Enable higher contrast text for darker style
	},

	disable = {
		background  = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines   = false -- Hide the end-of-buffer lines
	},

	custom_highlights = {
		CursorLine = '#0000FF',
		LineNr     = '#FF0000'
	}
})

-- Prevent focusing LSP floating window
vim.lsp.handlers["textDocument/hover"]          = vim.lsp.with(vim.lsp.handlers.hover, { focusable    = false })

function _G.custom_fold_text()
	local foldstart = vim.fn.getline(vim.v.foldstart)
	local foldend   = string.sub((vim.fn.getline(vim.v.foldend):gsub("^%s*(.-)%s*$", "%1")), 0, 10)
	local indent    = string.rep(" ", vim.fn.indent(vim.v.foldstart) - (vim.fn.indent(vim.v.foldstart) / vim.bo.shiftwidth))
	local result    = indent .. foldstart

	if string.len(foldend) <= 3 then
		return result .. " ... " .. foldend
	else
		return result
	end
end
