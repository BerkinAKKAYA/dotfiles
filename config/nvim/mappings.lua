-- local map = vim.api.nvim_set_keymap
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- plugins
map('n', '<C-q>', ':Neotree toggle<CR>', { noremap = true, silent = true })
map('n', '<C-p>', ':FzfLua files<CR>', { noremap = true, silent = true })
map('n', '<C-f>.', ':FzfLua lgrep_curbuf<CR>', { noremap = true, silent = true })
map('n', '<C-f>,', ':FzfLua grep_project<CR>', { noremap = true, silent = true })

-- tabs
map('n', '\x15', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<Space>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true, silent = true })

-- clear highlights
map('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

-- find and replace
map('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', 'cn', '*``cgn', {})
map('n', 'cN', '*``cgN', {})

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

-- map("n", "<C-t>", "<cmd>tabnew<CR>", {})
