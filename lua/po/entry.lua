local m = {}

local function fetch_next()
	return {
		msgid = "This is a sample text.",
		msgstr = "これはサンプルテキストです。",
	}
end

m.fetch_next = fetch_next

return m
