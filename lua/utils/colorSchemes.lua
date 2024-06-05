local M = {}

local function set_theme(theme)
	vim.cmd("colorscheme " .. theme)
end

function M.onedark()
	require("onedark").setup({
		highlights = {
			Comment = { italic = true },
			Directory = { bold = true },
			ErrorMsg = { italic = true, bold = true },
		},
	})
	set_theme("onedark")
end

function M.rose_pine()
	require("rose-pine").setup({
		variant = "moon", -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
			migrations = true, -- Handle deprecated options automatically
		},
		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},
		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",
			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",
			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		highlight_groups = {
			-- Comment = { fg = "foam" },
			-- VertSplit = { fg = "muted", bg = "muted" },
		},
		before_highlight = function(group, highlight, palette)
			-- Disable all undercurls
			-- if highlight.undercurl then
			--     highlight.undercurl = false
			-- end
			--
			-- Change palette colour
			-- if highlight.fg == palette.pine then
			--     highlight.fg = palette.foam
			-- end
		end,
	})
	set_theme("rose-pine")
end

function M.cyberdream()
	require("cyberdream").setup({
		transparent = true,
		italic_comments = true,
		-- hide_fillchars = true,
		borderless_telescope = false,
		terminal_colors = true,
	})
	set_theme("cyberdream")
end

function M.gruvbox_material()
	vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
	vim.g.gruvbox_material_foreground = "material" -- original, mix, material
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_sign_column_background = "none"

	local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = grpid,
		pattern = "gruvbox-material",
		command = "hi NvimTreeNormal                     guibg=#181818 |"
			.. "hi NvimTreeEndOfBuffer                guibg=#181818 |"
			.. "hi NoiceCmdlinePopupBorderCmdline     guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePromptBorder              guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePromptNormal              guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePromptTitle               guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePromptPrefix              guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePromptCounter             guifg=#ea6962 guibg=#282828 |"
			.. "hi TelescopePreviewTitle              guifg=#89b482 guibg=#282828 |"
			.. "hi TelescopePreviewBorder             guifg=#89b482 guibg=#282828 |"
			.. "hi TelescopeResultsTitle              guifg=#89b482 guibg=#282828 |"
			.. "hi TelescopeResultsBorder             guifg=#89b482 guibg=#282828 |"
			.. "hi TelescopeMatching                  guifg=#d8a657 guibg=#282828 |"
			.. "hi TelescopeSelection                 guifg=#ffffff guibg=#32302f |"
			.. "hi FloatBorder                        guifg=#ea6962 guibg=#282828 |"
			.. "hi BqfPreviewBorder                   guifg=#ea6962 guibg=#282828 |"
			.. "hi NormalFloat                        guibg=#282828 |"
			.. "hi IndentBlanklineContextChar         guifg=#d3869b |"
			.. "hi StatusColumnBorder                 guifg=#232323 |"
			.. "hi StatusColumnBuffer                 guibg=#282828 |"
			.. "hi CursorLineNr                       guifg=#d8a657 |"
			.. "hi CodewindowBorder                   guifg=#ea6962 |"
			.. "hi TabLine                            guibg=#282828 |",
	})
	set_theme("gruvbox-material")
end

function M.kanagawa()
	require("kanagawa").setup({
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		overrides = function(colors) -- add/modify highlights
			return {}
		end,
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	})
	set_theme("kanagawa")
end

function M.monokai_pro()
	require("monokai-pro").setup({
		transparent_background = false,
		terminal_colors = true,
		devicons = true, -- highlight the icons of `nvim-web-devicons`
		styles = {
			comment = { italic = true },
			keyword = { italic = true }, -- any other keyword
			type = { italic = true }, -- (preferred) int, long, char, etc
			storageclass = { italic = true }, -- static, register, volatile, etc
			structure = { italic = true }, -- struct, union, enum, etc
			parameter = { italic = true }, -- parameter pass in function
			annotation = { italic = true },
			tag_attribute = { italic = true }, -- attribute of tag in reactjs
		},
		filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
		day_night = {
			enable = false, -- turn off by default
			day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
		},
		inc_search = "background", -- underline | background
		background_clear = { "float_win", "toggleterm" }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer"
		plugins = {
			bufferline = {
				underline_selected = false,
				underline_visible = false,
			},
			indent_blankline = {
				context_highlight = "default", -- default | pro
				context_start_underline = false,
			},
		},
		override = function(c) end,
	})
	set_theme("monokai-pro")
end

function M.apply_theme(theme)
	local theme_function_name = theme:gsub("-", "_")
	if M[theme_function_name] then
		M[theme_function_name]()
	else
		set_theme(theme)
	end
end

return M
