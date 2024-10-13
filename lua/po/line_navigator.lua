---@class LineNavigator
---@field private current_line_number number The current line number.
---@field private get_line fun(line_number : number) : string A function that returns the line content of the given line number.
---@field previous fun(self) : string The previous line content.
---@field next fun(self) : string The next line content.
local line_navigator = {}

---@return string previous_line previous line content.
function line_navigator:previous()
	self.current_line_number = self.current_line_number - 1
	return self.get_line(self.current_line_number)
end

---@return string next_line next line content.
function line_navigator:next()
	self.current_line_number = self.current_line_number + 1
	return self.get_line(self.current_line_number)
end

local m = {}

---@param current_line_number number The current line number.
---@param get_line fun(line_number : number) : string A function that returns the line content of the given line number.
---@return LineNavigator instance The new instance of LineNavigator.
local function new(current_line_number, get_line)
	local self = setmetatable({}, line_navigator)

	self.current_line_number = current_line_number
	self.get_line = get_line

	return self
end

m.new = new

return m
