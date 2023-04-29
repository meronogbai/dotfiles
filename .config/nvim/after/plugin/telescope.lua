local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project)

telescope.setup {
  extensions = {
    project = {
      sync_with_nvim_tree = true,
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('project')
