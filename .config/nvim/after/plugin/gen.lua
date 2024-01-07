require('gen').setup(
  {
    model = "mistral",      -- The default model to use.
    display_mode = "split", -- The display mode. Can be "float" or "split".
    show_prompt = true,     -- Shows the Prompt submitted to Ollama.
    no_auto_close = true,   -- Never closes the window automatically.
  }
)

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
