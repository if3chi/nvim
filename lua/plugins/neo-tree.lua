return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim", -- "3rd/image.nvim",
	},
	config = function()
		vim.keymap.set("n", "\\", "<cmd>Neotree reveal right toggle<cr>", { desc = "NeoTree reveal" })
	end,
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
