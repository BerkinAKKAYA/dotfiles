require "paq" {
	"nvim-lua/plenary.nvim"; -- for telescope

    "savq/paq-nvim";
    "tpope/vim-surround";
	"norcalli/nvim-colorizer.lua";
	"phaazon/hop.nvim";
	"terrortylor/nvim-comment";
	"jiangmiao/auto-pairs";
	"alvan/vim-closetag";
	{ "nvim-telescope/telescope.nvim", tag="0.1.0" };

	-- git integration
	"f-person/git-blame.nvim";
	"lewis6991/gitsigns.nvim";

	-- color scheme
	"Shatur/neovim-ayu";
}

require('colorizer').setup({ '*' }, { rgb_fn = true })
require('hop').setup()
require('nvim_comment').setup()
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
require('ayu').setup({})
