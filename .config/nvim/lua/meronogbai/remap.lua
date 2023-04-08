-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better keyboard navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-j>', '<C-w>j', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

-- Insert --
-- Press jj to Escape
vim.keymap.set("i", "jj", "<Esc>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Disable worst feature in vim
vim.keymap.set("v", "p", '"_dP')

-- Command --
-- wd = write and delete buffer
vim.keymap.set('c', 'wd', 'w | bd')
