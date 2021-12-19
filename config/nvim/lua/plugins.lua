require('paq') {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope
	'RishabhRD/popfix'; -- for lsputils

	-- appearance
	'marko-cerovac/material.nvim';
	'kyazdani42/nvim-web-devicons';
	'alvarosevilla95/luatab.nvim';

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
	'jwalton512/vim-blade';
	'sbdchd/neoformat';
	'RishabhRD/nvim-lsputils';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

-- setup lsp
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities())
end
require('lspconfig').volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

-- setup plugins
require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop').setup()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('luatab').setup{}
require('telescope').setup({ defaults = { file_ignore_patterns = { "node_modules" } } })
require('gitsigns').setup({
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '+', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn'   },
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
		eob_lines   = true -- Hide the end-of-buffer lines
	},

	custom_highlights = {
		CursorLine = '#0000FF',
		LineNr     = '#FF0000'
	}
})
