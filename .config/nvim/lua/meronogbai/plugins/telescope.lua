return {
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep)
      vim.keymap.set('n', '<leader>fb', builtin.buffers)
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
      vim.keymap.set('n', '<leader>ft', builtin.git_status)
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
      vim.keymap.set('n', '<leader>fk', builtin.keymaps)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags)
      vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project)

      telescope.setup {
        pickers = {
          find_files = {
            hidden = true
          },
          live_grep = {
            additional_args = function(_)
              return { "--hidden" }
            end
          },
          oldfiles = {
            cwd_only = true,
          }
        },
        defaults = {
          file_ignore_patterns = { "^node_modules/", "^.git/" },
          prompt_prefix = " ",
        },
        extensions = {
          project = {
            sync_with_nvim_tree = true,
          }
        }
      }

      telescope.load_extension('fzf')
      telescope.load_extension('project')
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },

}
