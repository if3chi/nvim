return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets
				-- This step is not supported in many windows environments
				-- Remove the below condition to re-enable on windows
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				"garymjr/nvim-snippets",
				opts = {
					friendly_snippets = true,
				},
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		{ "saadparwaiz1/cmp_luasnip", enabled = true },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-emoji",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		-- local types = require("luasnip.util.types")

		-- luasnip.config.setup({
		-- 	ext_opts = {
		-- 		[types.choiceNode] = {
		-- 			active = { virt_text = { { "⇥", "GruvboxRed" } } },
		-- 		},
		-- 		[types.insertNode] = {
		-- 			active = { virt_text = { { "⇥", "GruvboxBlue" } } },
		-- 		},
		-- 	},
		-- })
		lspkind.init({})
		luasnip.config.setup({})

		cmp.setup({
			---@diagnostic disable-next-line: missing-fields
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 70,
					show_labelDetails = true,
					ellipsis_char = "...",
					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<C-e>"] = cmp.mapping.close(),

				-- Select the [n]ext item or jump to next completion.
				["<tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				-- Select the [p]revious item
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "vsnip" },
				{ name = "emoji" },
			},
		})
	end,
}
