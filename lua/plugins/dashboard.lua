return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = [[
		   _ _______     __   _ 
		  (_) _/_  /____/ /  (_)
		 / / _//_ </ __/ _ \/ / 
		/_/_//____/\__/_//_/_/  
		 
	   (X - @ifeabasi | GitHub - @if3chi)
   ]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				-- this is taken care of by lualine
				-- enabling this messes up the actual laststatus setting after loading a file
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
			{ action = "ene | startinsert",                   	desc = " New file", icon = " ", key = "n" },
			{ action = require"telescope.builtin".find_files, 	desc = " Find file", icon = " ", key = "f" },
      { action = "Telescope live_grep", 					        desc = " Find text", icon = " ", key = "g" },
			{ action = "Telescope oldfiles",                  	desc = " Recent files", icon = " ", key = "r" },
			{ action = 'lua require("persistence").load()',   	desc = " Restore Session", icon = " ", key = "s" },
     	{ action = function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), }) end,
																                          desc = " Config", icon = " ", key = "c" },
			{ action = "Lazy",                               	  desc = " Lazy", icon = "󰒲 ", key = "l" },
			{ action = "checkhealth",                        	  desc = " Check health", icon = " ", key = "h" },
			{ action = "qa",                                  	desc = " Quit", icon = " ", key = "q" },
        },
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { " Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "DashboardLoaded",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		return opts
	end,
}
