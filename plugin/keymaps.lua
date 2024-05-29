local set = vim.keymap.set

-- Save file
set("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "[S]ave file" })
set("i", "<C-s>", "<Esc><cmd>w<cr>a", { noremap = true, silent = true, desc = "[S]ave file" })
set("v", "<C-s>", "<Esc><cmd>w<cr>gv", { noremap = true, silent = true, desc = "[S]ave file" })

-- Quit File
set("n", "<C-q>", "<cmd>q<CR>", { noremap = true, silent = true, desc = "[Q]uit file" })
set("i", "<C-q>", "<Esc><cmd>q<CR>", { noremap = true, silent = true, desc = "[Q]uit file" })
set("v", "<C-q>", "<Esc><cmd>q<CR>", { noremap = true, silent = true, desc = "[Q]uit file" })

-- Jump through files
set("n", "C-d", "C-d>zz", { noremap = true, silent = true })
set("n", "C-u", "C-u>zz", { noremap = true, silent = true })
set("n", "n", "nzzzv", { noremap = true, silent = true })
set("n", "N", "Nzzzv", { noremap = true, silent = true })

set("n", "<C-x>", "<cmd>bd<cr>", { desc = "Close open buffer" })
-- set("n", "<C-X>", "<cmd>qa<cr>", { desc = "Close nvim editor" })

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- set("n", "<leader>so", "<cmd>source %<cr>", { desc = "Execute the current file" })

-- Toggle hlsearch if it's on, otherwise just do "enter"  "epwalsh/obsidian.nvim",
set("n", "<cr>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<cr>"
	end
end, { expr = true })

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<M-j>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! ]c]])
	else
		vim.cmd([[m .+1<cr>==]])
	end
end)

set("n", "<M-k>", function()
	if vim.opt.diff:get() then
		vim.cmd([[normal! [c]])
	else
		vim.cmd([[m .-2<cr>==]])
	end
end)
