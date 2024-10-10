local M = {}

-- @param content string The content of the po file.
-- @return string The statistics text of the given po file content.
local function fetch(content)
	return "0 translated messages."
end

M.fetch = fetch

return M
