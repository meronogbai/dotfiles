-- See https://www.reddit.com/r/neovim/comments/12c4ad8/closing_unused_buffers/

-- Keep track of unused buffers
vim.api.nvim_create_autocmd({ "BufRead" }, {
	group = vim.api.nvim_create_augroup("startup", {
		clear = false,
	}),
	pattern = { "*" },
	callback = function()
		vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
			buffer = 0,
			once = true,
			callback = function()
				vim.fn.setbufvar(vim.api.nvim_get_current_buf(), "bufpersist", 1)
			end,
		})
	end,
})

-- Close unused buffers
vim.keymap.set("n", "<leader>bu", function()
	local curbufnr = vim.api.nvim_get_current_buf()
	local buflist = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buflist) do
		if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
			vim.cmd("bd " .. tostring(bufnr))
		end
	end
end, { silent = true, desc = "Close unused buffers" })

vim.keymap.set("n", "<leader>bc", "<cmd>bd!<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>bufdo bd<cr>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers except current one" })
vim.keymap.set("n", "<leader>bt", "<cmd>windo bd<cr>", { desc = "Close all buffers in current tab" })
