local g = vim.g
local opt = vim.opt

-- Faster loading for providers
-- g.node_host_prog = "/usr/bin/neovim-node-host"
g.python3_host_prog = "/usr/bin/python3"

g.mapleader = " "
g.maplocalleader = " "

-- White characters --
opt.smartindent = true -- reacts to syntax of code (e.g., C)
opt.tabstop = 2 -- 1 tab = 4 columns
opt.shiftwidth = 2 -- indentation rule (<< >>)
opt.expandtab = true -- expand tab to spaces
-- q: comment formatting; n: numbered lists; j: remove comment when joining lines; 1: don't break after one-letter word
opt.formatoptions = "qnj1"
opt.breakindent = true -- indent when breaking lines

opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.showmode = false

-- Line numbers --
opt.number = true
opt.cursorline = true -- shows current line
opt.relativenumber = true -- shows relative numbers

opt.termguicolors = true -- True color support

-- vim.keymap.set("n", "<leader>qq", vim.cmd.Ex, { desc = "Close Editor" })

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Clipboard --
opt.clipboard = "unnamedplus"

-- Character Limit Warning --
-- opt.colorcolumn = "120"

-- Hidden Chars --
opt.list = false
opt.listchars = { tab = "» ", trail = "⋅", nbsp = "␣", eol = "↴" }

-- Scrolling --
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Session Options --
opt.sessionoptions = { "curdir", "folds", "tabpages", "winsize", "winpos" }

-- Spell Check --
opt.spell = false
opt.spelllang = "en_us"

-- Backup files --
opt.backup = false
opt.writebackup = false -- do not write/delete backup upon successful save
opt.swapfile = true
opt.undofile = true
opt.backupdir:remove(".") -- keep backups out of the current directory

-- Splitting --
opt.splitbelow = true
opt.splitright = true
opt.inccommand = "split" -- preview substitutions in a split

-- Hidden buffers --
opt.hidden = true

-- Transparency in popup menu (required for cmp-tailwind-colors) --
opt.pumblend = 15

-- Searching --
opt.ignorecase = true
opt.smartcase = true -- case-sensitive when not all lower

-- Path --
opt.path:append("**") -- Enables recursive sub-directory searching

-- Sign Column
opt.signcolumn = "yes:1"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300 -- time for a mapped sequence to complete

-- Diagnostic config
vim.diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	float = {
		source = "always",
		border = "rounded",
	},
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

-- Filetypes --
vim.filetype.add({
	extension = {
		keymap = "dts",
		neon = "yaml",
		overlay = "dts",
	},
	pattern = {
		[".*%.antlers%.html"] = "antlers.html",
		[".*%.blade%.php"] = "blade",
		[".*%.neon%.dist"] = "yaml",
	},
})
