local map = vim.keymap
local opts = { noremap = true, silent = true }

map.set('n', '<Space>', '', {})
vim.g.mapleader = ' '

map.set('n', '<leader>cc', '<cmd>e $MYVIMRC<cr>')

-- Better navigation between windows
map.set('n', '<C-h>', '<C-w>h', opts)
map.set('n', '<C-j>', '<C-w>j', opts)
map.set('n', '<C-k>', '<C-w>k', opts)
map.set('n', '<C-l>', '<C-w>l', opts)
