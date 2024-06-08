local themes = {
	["tokyonight"] = "folke/tokyonight.nvim",
	["rose-pine"] = "rose-pine/neovim",
	["cyberdream"] = "scottmckendry/cyberdream.nvim",
	["gruvbox-material"] = "sainnhe/gruvbox-material",
	["kanagawa"] = "rebelot/kanagawa.nvim",
	["monokai-pro"] = "loctvl842/monokai-pro.nvim",
}

local selected_theme = "rose-pine" -- Change this to switch themes

-- TODO: implement autoload themes
-- local function get_plugins()
-- 	local plugins = {}
-- 	for theme, repo in pairs(themes) do
-- 		table.insert(plugins, {
-- 			repo,
-- 			name = theme,
-- 			lazy = true,
-- 			config = function()
-- 					vim.notify("Loading theme: " .. theme, vim.log.levels.INFO) -- Debug notification
-- 					require("utils.colorSchemes").apply_theme(theme)
-- 			end,
-- 		})
-- 	end
-- 	return plugins
-- end

return {
	themes[selected_theme],
	name = selected_theme,
	priority = 1000,
	lazy = false,
	config = function()
		require("utils.colorSchemes").apply_theme(selected_theme)
	end,
}
