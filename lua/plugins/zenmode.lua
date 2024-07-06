return {
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		config = function()
			local plugins = {
				-- disable some global vim options (vim.o...)
				options = {
					enabled = true,
					ruler = true, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					-- you may turn on/off statusline in zen mode by setting 'laststatus'
					-- statusline will be shown only if 'laststatus' == 3
					laststatus = 0, -- turn off the statusline in zen mode
				},
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = true }, -- disables the tmux statusline
				wezterm = {
					enabled = true,
					font = "+20", -- (10% increase per step)
				},
				-- this will change the font size on kitty when in zen mode
				-- to make this work, you need to set the following kitty options:
				-- - allow_remote_control socket-only
				-- - listen_on unix:/tmp/kitty
				kitty = {
					enabled = false,
					font = "+20", -- font size increment
				},
			}

			vim.keymap.set("n", "<leader>zz", function()
				require("zen-mode").setup({
					window = {
						width = 110,
						options = {},
					},
					plugins = plugins,
				})
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = true
				vim.wo.rnu = true
			end, { desc = "[Z]en mode" })

			vim.keymap.set("n", "<leader>zZ", function()
				require("zen-mode").setup({
					window = {
						width = 100,
						options = {},
					},
					plugins = plugins,
				})
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = false
				vim.wo.rnu = false
				vim.opt.colorcolumn = "0"
			end, { desc = "True [Z]en" })
		end,
	},
	{
		"folke/twilight.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
