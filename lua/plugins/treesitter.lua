return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			-- @todo: configure plugin
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
		opts = {
			textobjects = { -- 'nvim-treesitter/nvim-treesitter-textobjects',
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["if"] = "@function.inner",
						["af"] = "@function.outer",
						["ic"] = "@class.inner",
						["ac"] = "@class.outer",
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",
					},
				},
			},
		},
		config = function(_, opts)
			-- https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			---@diagnostic disable-next-line: inject-field
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "blade",
			}

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(vim.tbl_extend("keep", opts, {
				ensure_installed = {
					"bash",
					"c",
					"html",
					"lua",
					"markdown",
					"vim",
					"vimdoc",
					"javascript",
					"php",
					"php_only",
					"python",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			}))
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {},
	},
}
