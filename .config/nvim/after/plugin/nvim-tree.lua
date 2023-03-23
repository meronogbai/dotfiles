local nvim_tree = require('nvim-tree')
local api = require('nvim-tree.api')

nvim_tree.setup()

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
