return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			custom = { "^\\.git$", ".DS_Store" },
		},
		git = {
			ignore = false,
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
	},
	cmd = { "NvimTreeFindFileToggle" },
	keys = { { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "File Explorer" } },
}
