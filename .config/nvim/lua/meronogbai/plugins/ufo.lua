return {
	"kevinhwang91/nvim-ufo",
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
	init = function()
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	dependencies = "kevinhwang91/promise-async",
}
