local m = {}

local regexes = {
	untranslated_or_fuzzy = [[\v^msgstr(\[\d+\])?(\_s*"")+(\_s*"[^"]+)@!|^#, fuzzy]],
	msgstr = [[\v^msgstr(\[\d+\])?\_s*"]],
}

---@enum direction
local direction = {
	FORWARD = 1,
	BACKWARD = -1,
}

local function jump(dir)
	assert(dir == direction.FORWARD or dir == direction.BACKWARD, "Invalid direction")

	local options = dir == direction.FORWARD and "w" or "bwz"

	local untranslated_or_fuzzy_line = vim.fn.search(regexes.untranslated_or_fuzzy, options)

	if untranslated_or_fuzzy_line == 0 then
		print("No entry to jump to.")
		return
	end

	local msgstr_line = vim.fn.search(regexes.msgstr, "wce")

	if msgstr_line == 0 then
		error("`msgstr` line not found")
		return
	end
end

function m.forward()
	jump(direction.FORWARD)
end

function m.backward()
	jump(direction.BACKWARD)
end

return m
