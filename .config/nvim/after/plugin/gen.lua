require('gen').setup(
  {
    model = "mistral",      -- The default model to use.
    display_mode = "split", -- The display mode. Can be "float" or "split".
    no_auto_close = true,   -- Never closes the window automatically.
  }
)

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
