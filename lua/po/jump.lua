local m = {}

local untranslated_or_fuzzy_regex =
	[[\v^msgstr(\[\d+\])?(\_s*"\ze")+(\_s*"[^"]+)@!|^#, fuzzy\_.{-}msgstr\_s*"\ze[^"]*"]]

---@enum direction
local direction = {
	FORWARD = 1,
	BACKWARD = -1,
}

local function jump(dir)
	assert(dir == direction.FORWARD or dir == direction.BACKWARD, "Invalid direction")

	local options = dir == direction.FORWARD and "we" or "bwze"

	local untranslated_or_fuzzy_line = vim.fn.search(untranslated_or_fuzzy_regex, options)

	if untranslated_or_fuzzy_line == 0 then
		print("No entry to jump to.")
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
