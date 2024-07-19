-- TODO: fix conflicting keymaps in go environments

return {
	"ray-x/go.nvim",
	event = { "CmdlineEnter" },
	ft = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
	build = '<cmd>lua require("go.install").update_all_sync()',
	dependencies = {
		{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		{ "hrsh7th/nvim-cmp" },
		{ "neovim/nvim-lspconfig" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("go").setup({
			verbose = true,
			lsp_cfg = {
				handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
					["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "round" }),
				},
				goimports = "goimports",
				gofmt = "gopls",
				max_line_len = 80,
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go" },
			callback = function(_)
				-- CTRL/control keymaps
				vim.api.nvim_buf_set_keymap(0, "n", "<C-i>", "<cmd>GoImports<CR>", {})
				vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", "<cmd>GoBuild %<cmd>h<CR>", {})
				vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", "<cmd>GoTestPkg<CR>", {})
				vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", "<cmd>GoCoverage -p<CR>", {})

				-- Opens test files
				-- stylua: ignore
				vim.api.nvim_buf_set_keymap(0, "n", "A", "<cmd>lua require('go.alternate').switch(true, '')<CR>", {})   -- Test
				vim.api.nvim_buf_set_keymap(0, "n", "V", "<cmd>lua require('go.alternate').switch(true, 'vsplit')<CR>", {}) -- Test Vertical
				vim.api.nvim_buf_set_keymap(0, "n", "S", "<cmd>lua require('go.alternate').switch(true, 'split')<CR>", {}) -- Test Split
			end,
			group = vim.api.nvim_create_augroup("go_autocommands", { clear = true }),
		})

		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
}
