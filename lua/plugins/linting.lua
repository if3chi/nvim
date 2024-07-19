return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff" },
			php = { "phpstan" },
			markdown = { "markdownlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		local try_lint = function()
			lint.try_lint()
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = try_lint,
		})

		vim.keymap.set("n", "<leader>lc", try_lint, { desc = "[L]int [C]ode" })
	end,
}
