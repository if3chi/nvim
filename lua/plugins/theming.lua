return {
	-- "catppuccin/nvim",
	"folke/tokyonight.nvim",
	-- "loctvl842/monokai-pro.nvim",
	-- "rebelot/kanagawa.nvim",
	-- "sainnhe/gruvbox-material",
	-- "olimorris/onedarkpro.nvim",
	-- "scottmckendry/cyberdream.nvim",
	name = "tokyonight",
	priority = 1000,
	lazy = false,
	config = function()
		require("utils.colourSchemes").tokyoNight()

		-- vim.cmd.colorscheme("catppuccin")
		-- vim.cmd.colorscheme("onedark")
	end,
}
