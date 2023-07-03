require "paq" {
    'savq/paq-nvim',
    'nvim-tree/nvim-web-devicons',
    'ellisonleao/gruvbox.nvim',
    'f-person/git-blame.nvim',
    'sbdchd/neoformat',
    'windwp/nvim-autopairs',
    'notjedi/nvim-rooter.lua',
	'sbdchd/neoformat',
	'tpope/vim-fugitive',
	'numToStr/FTerm.nvim',
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x' },
    { 'ibhagwan/fzf-lua', branch = 'main' },
    { 'nvim-treesitter/nvim-treesitter', run = function() pcall(vim.cmd, 'TSUpdate') end },
    { 'kylechui/nvim-surround', tag = "*" },
    { 'akinsho/bufferline.nvim', tag = "*" },

	-- Helpers
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

	-- Mason
	{ 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end };
	'williamboman/mason-lspconfig.nvim',

	-- LSP Zero
	'neovim/nvim-lspconfig',
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v2.x' },

	-- Completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'L3MON4D3/LuaSnip',
}

require('nvim-treesitter.configs').setup({ ensure_installed = 'all' })
require("nvim-autopairs").setup({})
require('nvim-rooter').setup()
require("nvim-surround").setup({})
require("neo-tree").setup({})
require('mason').setup({ ui = { border = 'rounded' }})
require("mason-lspconfig").setup { ensure_installed = { "lua_ls", "eslint", "gopls", "rust_analyzer", "tsserver" } }
require('fzf-lua').setup({'telescope'})
require("bufferline").setup({
    highlights = { fill = { bg = 'NONE' } },
    options = {
		separator_style = {"", ""},
        offsets = {
            {
                filetype = "neo-tree",
                text = "Neotree",
                separator = true,
                text_align = "left",
            }
        },
    },
})
require('FTerm').setup({
    border = 'rounded',
    dimensions  = {
        height = 0.6,
        width = 0.6,
    },
})

-- LSP Zero
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup()

-- CMP
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	},
})
