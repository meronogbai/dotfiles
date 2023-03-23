local nvim_tree = require("nvim-tree")
local api = require('nvim-tree.api')

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<leader>e', function()
    api.tree.toggle(true)
  end)

  vim.keymap.set('n', 'l', api.node.open.edit)
  vim.keymap.set('n', 'h', api.node.navigate.parent_close)
end

nvim_tree.setup {
    on_attach = on_attach
}


local function open_nvim_tree()
  -- always open the tree
  api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
