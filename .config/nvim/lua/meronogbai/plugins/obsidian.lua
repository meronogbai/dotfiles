return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",

	opts = {
		ui = {
			enable = false,
		},
		-- storing these notes in icloud
		dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
		-- mappings = {
		--   -- use gk instead of gf because i need gf to format files
		--   ["gk"] = require("obsidian").util.gf_passthrough(),
		--   -- Toggle check-boxes.
		--   ["<leader>ch"] = {
		--     action = function()
		--       return require("obsidian").util.toggle_checkbox()
		--     end,
		--     opts = { buffer = true },
		--   },
		-- }
	},
}
