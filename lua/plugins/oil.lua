return {
	"stevearc/oil.nvim",
	dependecies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icons" },
			keymaps = {
				["<C-h>"] = false,
				["<M-h"] = "actions.select_split",
			},
			view_options = { show_hidden = true },
		})

		vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
		vim.keymap.set(
			"n",
			"<space>-",
			require("oil").toggle_float,
			{ desc = "Open parent directory in floating mode" }
		)
	end,
}
