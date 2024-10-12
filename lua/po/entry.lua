local M = {}

local function fetch_next()
	return {
		msgid = "This is another sample text.",
		msgstr = "これは別のサンプルテキストです.",
	}
end

M.fetch_next = fetch_next

return M
