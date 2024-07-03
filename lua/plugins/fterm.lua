return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			blend = 5,
			dimensions = {
				height = 0.90,
				width = 0.90,
				x = 0.5,
				y = 0.5,
			},
		})

		vim.keymap.set("n", "<C-`>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<C-`>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
