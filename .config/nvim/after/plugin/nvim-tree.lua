local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  diagnostics = {
    enable = true
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb 'edit' },
        { key = 'h', cb = tree_cb 'close_node' },
        { key = 'v', cb = tree_cb 'vsplit' },
      }
    },
  },
}

vim.keymap.set('n', '<leader>e',
  function()
    nvim_tree.toggle(true, false)
  end
)
