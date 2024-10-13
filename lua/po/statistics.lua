local async = require("plenary.async")

local m = {}

---@param filename string The name of the po file.
---@param statistics_lang string The language of the statistics text.
---@return string|nil The statistics text of the given po file, or nil on an error.
local function fetch(filename, statistics_lang)
	local async_system = async.wrap(vim.system, 3)

	---@type { code: number, stderr: string }
	local obj = async_system(
		{ "msgfmt", "--statistics", "--output-file=/dev/null", filename },
		{ env = { LANG = statistics_lang }, text = true }
	)

	if obj.code ~= 0 then
		return
	end

	local s, _ = string.gsub(obj.stderr, "^%s*(.-)%s*$", "%1")

	return s
end

m.fetch = fetch

return m
