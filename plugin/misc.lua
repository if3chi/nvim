-- FTerm
vim.api.nvim_create_user_command("NpmRunDev", function()
	require("FTerm").run({ "npm run dev" })
end, { bang = true })
