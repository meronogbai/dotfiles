local gen = require('gen')

gen.setup(
  {
    model = "codellama",
    display_mode = "split",
    no_auto_close = true,
  }
)

gen.prompts['Add tests'] = {
  prompt =
  "You're a senior software engineer who's experienced in testing. Write tests for the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
}

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
