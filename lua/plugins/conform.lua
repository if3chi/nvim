return {
	"stevearc/conform.nvim",
	event = "InsertEnter",
	lazy = true,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier", "eslint_d" } },
			javascriptreact = { { "prettierd", "prettier", "eslint_d" } },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			typescript = { { "prettierd", "prettier", "eslint_d" } },
			typescriptreact = { { "prettierd", "prettier", "eslint_d" } },
			html = { "prettierd" },
			ejs = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			graphql = { "prettierd" },
			markdown = { "prettierd" },
			blade = { "blade-formatter" },
			php = { "pint", "phpstan", "php-cs-fixer" },
			python = { "isort", "black" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
	},
}
