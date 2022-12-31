local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup {
  defaults = {
    mappings = {
      n = {
        q = actions.close
      }
    }
  }
}

telescope.load_extension('fzf')
