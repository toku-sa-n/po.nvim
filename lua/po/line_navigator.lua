---@class LineNavigator
---@field private current_line_number number The current line number.
---@field private get_line fun(line_number : number) : string A function that returns the line content of the given line number.
---@field previous fun(self) : string The previous line content.
---@field next fun(self) : string The next line content.
local LineNavigator = {}

---@param current_line_number number The current line number.
---@param get_line fun(line_number : number) : string A function that returns the line content of the given line number.
---@return LineNavigator A new instance of LineNavigator.
function LineNavigator.new(current_line_number, get_line)
	local self = setmetatable({}, LineNavigator)

	self.current_line_number = current_line_number
	self.get_line = get_line

	return self
end

---@return string The previous line content.
function LineNavigator:previous()
	self.current_line_number = self.current_line_number - 1
	return self.get_line(self.current_line_number)
end

---@return string The next line content.
function LineNavigator:next()
	self.current_line_number = self.current_line_number + 1
	return self.get_line(self.current_line_number)
end
