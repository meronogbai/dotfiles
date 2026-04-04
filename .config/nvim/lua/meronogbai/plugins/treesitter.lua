return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		main = "nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			local ensure_installed = { "rust", "tsx", "lua", "json", "css", "markdown", "markdown_inline" }
			local already_installed = require("nvim-treesitter.config").get_installed()
			local parsers_to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(already_installed, parser)
				end)
				:totable()

			require("nvim-treesitter").install(parsers_to_install)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(event)
					-- Enable treesitter highlighting and disable regex syntax
					pcall(vim.treesitter.start, event.buf)
					-- Enable treesitter-based indentation
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
}
