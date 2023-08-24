-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
vim.keymap.set("n", "<leader>v", "<cmd>:vsplit<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>:split<cr>")
vim.keymap.set("n", "<leader>co", "<cmd>:copen<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>:cclose<cr>")

-- Insert --
-- Press jj to Escape
vim.keymap.set("i", "jj", "<Esc>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Disable worst feature in vim
vim.keymap.set("v", "p", '"_dP')
