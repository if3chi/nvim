return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>r", group = "[R]egroup" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>z", group = "[Z]en mode" },
		})
	end,
}
