-- map <C-j> to accept copilot suggestion
vim.cmd [[imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  markdown = true,
}
