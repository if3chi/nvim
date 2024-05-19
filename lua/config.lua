vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true -- True color support

vim.opt.cursorline = true

vim.keymap.set("n", "<leader>qq", vim.cmd.Ex, { desc = "Close Editor" })

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- TODO: add vim key binding.
