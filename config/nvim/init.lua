local map = vim.api.nvim_set_keymap
local cmp = require('cmp')

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
vim.o.fillchars            = "fold: ,vert:│,eob: ,msgsep:‾"
vim.o.shortmess            = vim.o.shortmess .. 'c'
vim.o.showcmd              = false
vim.bo.shiftwidth          = 4
vim.bo.tabstop             = 4
vim.bo.syntax              = 'on'
vim.bo.expandtab           = false
vim.wo.signcolumn          = 'yes:1'
vim.wo.cursorline          = true
vim.wo.number              = true
vim.wo.relativenumber      = true
vim.wo.wrap                = false
vim.wo.foldexpr            = 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod          = 'indent'
vim.wo.foldnestmax         = 10
vim.wo.foldminlines        = 1
vim.opt.foldtext           = 'v:lua.custom_fold_text()'

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
	'AckslD/nvim-neoclip.lua';
	'nvim-telescope/telescope.nvim';
	'airblade/vim-rooter';
	'lumiliet/vim-twig'; -- autoindent
	'jiangmiao/auto-pairs';
	'alvan/vim-closetag';
	'godlygeek/tabular';

	-- programming
	'nvim-treesitter/nvim-treesitter';

	-- lsp
	'neovim/nvim-lspconfig';
	'RishabhRD/popfix'; -- for lsputils
	'RishabhRD/nvim-lsputils';
	'weilbith/nvim-code-action-menu';

	-- nvim-cmp
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/nvim-cmp';

	-- luasnip
	'L3MON4D3/LuaSnip';
	'saadparwaiz1/cmp_luasnip';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

-- plugins
map('n', 'F', ':HopWord<CR>', {})
map('n', '<C-f>', ':Telescope git_files<CR>', {})
map('n', '<C-p>', ':Telescope neoclip a extra=star,plus,b<CR>', {})

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

vim.api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
vim.api.nvim_command("command W :execute ':w'")
vim.api.nvim_command("command Q :execute ':q'")

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
vim.api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
vim.api.nvim_command('au BufWinLeave * silent! mkview')
vim.api.nvim_command('au BufWinEnter * silent! loadview')
vim.api.nvim_command('au BufWritePre *.* silent! lua vim.lsp.buf.formatting_sync(nil, 200)')
vim.api.nvim_command('au BufWinEnter *.blade.php set filetype=html')

-- setup lsp
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls', 'vuels' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-u>']     = cmp.mapping.scroll_docs(-4),
		['<C-d>']     = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>']     = cmp.mapping.close(),
		['<CR>']      = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}
})

-- setup plugins
require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop.highlight').insert_highlights()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('neoclip').setup()
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

-- lsputils configuration
vim.lsp.handlers['textDocument/codeAction']     = require('lsputil.codeAction').code_action_handler
vim.lsp.handlers['textDocument/references']     = require('lsputil.locations').references_handler
vim.lsp.handlers['textDocument/definition']     = require('lsputil.locations').definition_handler
vim.lsp.handlers['textDocument/declaration']    = require('lsputil.locations').declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
vim.lsp.handlers['workspace/symbol']            = require('lsputil.symbols').workspace_handler

function _G.custom_fold_text()
	local foldstart = vim.fn.getline(vim.v.foldstart)
	local foldend   = string.sub((vim.fn.getline(vim.v.foldend):gsub("^%s*(.-)%s*$", "%1")), 0, 10)
	local indent    = string.rep(" ", vim.fn.indent(vim.v.foldstart) - 1)
	local result    = indent .. foldstart

	if string.len(foldend) <= 3 then
		return result .. " ... " .. foldend
	else
		return result
	end
end
