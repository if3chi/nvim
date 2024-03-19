return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim", -- "3rd/image.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-e>", "<cmd>Neotree filesystem reveal right toggle<CR>", { desc = "Open Explorer" })
	end,
}
