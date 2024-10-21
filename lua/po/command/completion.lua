local subcommands = require("po.command.subcommands")

local m = {}

---@param args string[]
---@param prefix string
---@param depth number
---@return string[]
local function get_matching_subcommands(args, prefix, depth)
	assert(args[1] == "Po", "First argument must be 'Po'")

	local current_level = subcommands

	for i = 2, depth - 1 do
		current_level = current_level[args[i]]

		if type(current_level) ~= "table" then
			return {}
		end
	end

	---@param key string
	---@return string[]
	return vim.tbl_filter(function(key)
		return vim.startswith(key, prefix)
	end, vim.tbl_keys(current_level))
end

function m.complete(arg_lead, cmd_line)
	local args = vim.split(cmd_line, " ", { trimempty = true })
	local level = cmd_line:sub(-1) == " " and #args + 1 or #args

	local suggestions = get_matching_subcommands(args, arg_lead, level)

	table.sort(suggestions)

	return suggestions
end

return m
