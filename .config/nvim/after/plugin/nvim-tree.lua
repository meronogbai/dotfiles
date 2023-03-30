vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require('nvim-tree')
local api = require("nvim-tree.api");

nvim_tree.setup {
  filters = {
    custom = { "^\\.git$", ".DS_Store" }
  },
  git = {
    ignore = false
  }
}

vim.keymap.set('n', '<leader>e', function()
  api.tree.toggle(true, false)
end)
