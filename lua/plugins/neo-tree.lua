return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	-- keys = { { "\\", "<cmd>Neotree reveal right toggle<cr>", mode = "", desc = "NeoTree reveal" } },
	opts = {
		filesystem = {
			filtered_items = {
				-- visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".github",
					"package-lock.json",
					"composer.lock",
				},
				never_show = { ".git" },
			},
		},
	},
}
