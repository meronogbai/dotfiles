return {
	"nvim-lualine/lualine.nvim",

	opts = {
		options = {
			theme = "tokyonight",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
		},
	},

	dependencies = { "nvim-tree/nvim-web-devicons" },
}
