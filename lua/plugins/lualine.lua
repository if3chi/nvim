local function maximize_status()
	return vim.t.maximized and "   " or ""
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local lazy_status = require("lazy.status")

		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "tokyonight",
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "neo-tree" },
				},
			},
			sections = {
				lualine_c = { { "filename" }, { maximize_status } },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
