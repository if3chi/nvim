return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = false, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			javascript = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			typescript = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
			html = { "prettierd" },
			ejs = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			graphql = { "prettierd" },
			markdown = { "prettierd" },
			blade = { "blade-formatter", "rustywind", stop_after_first = true },
			php = { "pint", "phpstan", "php-cs-fixer", stop_after_first = true },
			python = { "isort", "black", stop_after_first = true },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			return {
				async = false,
				timeout_ms = 1000,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
	},
}
