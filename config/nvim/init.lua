local vim = vim
local api = vim.api
local cmp = require'cmp'

vim.o.guifont = "agave Nerd Font" -- for neovide
vim.o.completeopt = 'menu,menuone,noinsert'
vim.o.wildmode = 'list,longest'
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.mouse = 'a'
vim.o.ruler = false
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.updatetime = 1000
vim.o.hidden = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.wo.signcolumn = "yes:2"
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.foldmethod = 'indent'
vim.wo.foldnestmax = 1

api.nvim_command('colorscheme gruvbox')
api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
-- api.nvim_command('au BufWritePre,BufWinLeave * silent! mkview')
-- api.nvim_command('au BufWinEnter * silent! loadview')

api.nvim_command('command WW :execute ":silent w !doas tee % > /dev/null" | :edit!')
api.nvim_command('command W :execute ":w"')
api.nvim_command('command Q :execute ":q"')

api.nvim_command('au VimEnter * highlight HopNextKey  guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey1 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey2 guibg=#ff0000 guifg=#ffffff')

local removeBackgroundOf = { 'Normal', 'SignColumn', 'Folded', 'Tabine', 'TabLineFill', 'TabLineSel', 'MatchParen' }
for _, item in ipairs(removeBackgroundOf) do
	api.nvim_command('au VimEnter * highlight ' .. item .. ' gui=NONE guibg=NONE')
end

require "paq" {
	"savq/paq-nvim";

	"neovim/nvim-lspconfig";
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/nvim-cmp';
	'L3MON4D3/LuaSnip';
	'saadparwaiz1/cmp_luasnip';

	'blackCauldron7/surround.nvim';
	'akinsho/toggleterm.nvim';
	'morhetz/gruvbox';
	'norcalli/nvim-colorizer.lua';
	'phaazon/hop.nvim';
}

-- Setup CMP
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
    },
    mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
    },
    sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}
})

-- Setup LSP
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150, },
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

require("colorizer").setup({ '*' }, { rgb_fn = true })
require("surround").setup {mappings_style = "surround"}
require("toggleterm").setup{
	size = 10,
	open_mapping = [[<c-i>]],
	hide_numbers = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = false,
	direction = 'horizontal',
	close_on_exit = true,
	shell = vim.o.shell,
}
require'hop.highlight'.insert_highlights()

-- Clear search highlight on press enter
api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
api.nvim_set_keymap('n', 'F', ':HopWord<CR>', {})
