return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
			{
				"nvim-treesitter/nvim-treesitter-context", -- Show code context
				opts = {
					enable = true,
					max_lines = 7,
					min_window_height = 15,
					mode = "cursor",
					multiline_threshold = 10,
				},
			},
			"windwp/nvim-ts-autotag",
		},
		opts = {
			textobjects = { -- 'nvim-treesitter/nvim-treesitter-textobjects',
				select = {
					enable = true,
					lookahead = true,
				},
			},
		},
		config = function(_, opts)
			-- https://github.com/EmranMR/tree-sitter-blade/discussions/19#discussion-5400675
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			---@diagnostic disable-next-line: inject-field
			-- TODO: configure locals and indents
			parser_config["blade"] = {
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
					"dockerfile",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"sql",
					"yaml",
					"json",
					"regex",
					"tsx",
					"typescript",
				},
				auto_install = true,
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
				auto_tag = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Space>",
						node_incremental = "<C-Space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			}))
		end,
	},
}
