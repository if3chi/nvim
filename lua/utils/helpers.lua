local M = {}

--- Calls `<Esc>` in normal mode
---
--- Necessary for visual range to be updated before executing
--- visual keymaps
---
--- @return nil
function M.escape()
	vim.cmd.normal("�")
end

--- Wrapper around `vim.keymap.set` to include defaults
---
---@see vim.keymap.set()
---
---@param modes string|table the keymap mode
---@param lhs string left hand side
---@param rhs string|function right hand side
---@param opts nil|table options
function M.map(modes, lhs, rhs, opts)
	local defaults = {
		silent = true,
		noremap = true,
		expr = false,
		-- unique = true,
	}
	vim.keymap.set(modes, lhs, rhs, vim.tbl_extend("force", defaults, opts or {}))
end

return M
