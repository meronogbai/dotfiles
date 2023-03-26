local nvim_tree = require('nvim-tree')
local api = require("nvim-tree.api");

nvim_tree.setup {
  filters = {
    custom = { "^\\.git$" }
  },
  git = {
    ignore = false
  }
}

vim.keymap.set('n', '<leader>e', function()
  api.tree.toggle(true, false)
end)
