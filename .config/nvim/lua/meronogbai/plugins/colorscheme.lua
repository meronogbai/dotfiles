local function get_style_from_system_theme()
	-- Check if running on macOS
	if vim.fn.has("mac") == 1 then
		local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
		if handle then
			local result = handle:read("*a")
			local success = handle:close()

			-- If command succeeded and result contains 'Dark', system is in dark mode
			if success and result and result:match("Dark") then
				return "night"
			else
				-- If command failed or no 'Dark' found, system is in light mode
				return "day"
			end
		end
	end

	-- Default to night if unable to detect
	return "night"
end

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = get_style_from_system_theme(),
		transparent = true,
		styles = {
			comments = { italic = true },
		},
	},
	init = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
}
