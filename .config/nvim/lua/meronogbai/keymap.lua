-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<cr>", { desc = 'Split window vertically' })
vim.keymap.set("n", "<leader>s", "<cmd>:split<cr>", { desc = 'Split window horizontally' })
vim.keymap.set("n", "<leader>co", "<cmd>:copen<cr>", { desc = 'Open quickfix window' })
vim.keymap.set("n", "<leader>cc", "<cmd>:cclose<cr>", { desc = 'Close quickfix window' })

-- Insert --
vim.keymap.set("i", "jj", "<Esc>", { desc = 'Esc' })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Disable worst feature in vim
vim.keymap.set("v", "p", '"_dP')
