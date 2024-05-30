local function maximize_status()
	return vim.t.maximized and "   " or ""
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "neo-tree" },
				},
			},
			-- sections = {
			--     lualine_c = {{"filename"}, {maximize_status}},
			--     lualine_x = {{"filetype"}, {
			--         require("noice").api.status.mode.get,
			--         cond = require("noice").api.status.mode.has,
			--         color = {
			--             fg = "#ff9e64"
			--         }
			--     }, {
			--         require("noice").api.status.search.get,
			--         cond = require("noice").api.status.search.has,
			--         color = {
			--             fg = "#ff9e64"
			--         }
			--     }}
			-- }
		})
	end,
}
