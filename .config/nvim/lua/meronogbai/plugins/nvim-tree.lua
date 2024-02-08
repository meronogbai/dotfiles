return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    filters = {
      custom = { "^\\.git$", ".DS_Store" }
    },
    git = {
      ignore = false
    }
  },
  cmd = { 'NvimTreeFindFileToggle' },
  keys = { { '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'File Explorer' } }
}
