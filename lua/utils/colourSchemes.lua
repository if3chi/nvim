-- @class utils.colourSchemes

local M = {}

local function set_theme(theme)
	vim.cmd("colorscheme " .. theme)
end

function M.cyberDream()
	require("cyberdream").setup({
		transparent = true,
		italic_comments = true,
		-- hide_fillchars = true,
		borderless_telescope = false,
		terminal_colors = true,
	})

	set_theme("cyberdream")
end

function M.gruvBox()
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

function M.monokaiPro()
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
		-- Enable this will disable filter option
		day_night = {
			enable = false, -- turn off by default
			day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
		},
		inc_search = "background", -- underline | background
		background_clear = {
			"float_win",
			-- "toggleterm",
			"telescope",
			"which-key",
			"renamer",
			"notify",
			-- "nvim-tree",
			"neo-tree",
			-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
		}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
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
	})

	set_theme("monokai-pro")
end

function M.tokyoNight()
	require("tokyonight").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help", "nvimtree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@diagnostic disable-next-line: undefined-doc-name
		---@param colors ColorScheme
		on_colors = function(colors) end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@diagnostic disable-next-line: undefined-doc-name
		---@param highlights Highlights
		---@diagnostic disable-next-line: undefined-doc-name
		---@param colors ColorScheme
		on_highlights = function(highlights, colors) end,
	})

	set_theme("tokyonight")
end

return M
