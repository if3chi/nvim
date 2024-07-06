-- filetype related
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function(_)
		vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
	end,
})

-- FTerm
vim.api.nvim_create_user_command("NpmRunDev", function()
	require("FTerm").run({ "npm run dev" })
end, { bang = true })
