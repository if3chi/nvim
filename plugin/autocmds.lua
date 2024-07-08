-- Show only modifed buffers
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command

-- autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
-- 	callback = function()
-- 		vim.t.bufs = vim.tbl_filter(function(bufnr)
-- 			return vim.api.nvim_buf_get_option(bufnr, "modified")
-- 		end, vim.t.bufs)
-- 	end,
-- })

-- filetype related
autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function(_)
		vim.api.nvim_set_option_value("textwidth", 72, { scope = "local" })
	end,
})

-- FTerm
command("NpmRunDev", function()
	require("FTerm").run({ "npm run dev" })
end, { bang = true })
