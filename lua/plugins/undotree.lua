return {
	{
		"mbbill/undotree",
		config = function()
			local opt = vim.opt

			opt.undofile = true
			---@diagnostic disable-next-line: assign-type-mismatch
			opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
			opt.swapfile = false
			opt.backup = false

			vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo [T]ree" })
		end,
	},
}
