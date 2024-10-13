local M = {}

local function fetch_next()
	return {
		msgid = "This is a sample text.",
		msgstr = "これはサンプルテキストです。",
	}
end

M.fetch_next = fetch_next

return M
