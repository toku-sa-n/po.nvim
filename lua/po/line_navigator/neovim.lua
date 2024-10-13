local line_navigator = require("po.line_navigator")

local m = {}

---@return LineNavigator instance The new instance of LineNavigator.
local function new()
	local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
	local get_line = function(line_number)
		local lines = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)

		if #lines == 0 then
			return nil
		end

		return lines[1]
	end

	return line_navigator.new(current_line_number, get_line)
end

m.new = new

return m
