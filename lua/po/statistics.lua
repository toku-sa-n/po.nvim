local M = {}

-- @param content string The content of the po file.
-- @return string The statistics text of the given po file content.
function M:fetch_statistics_text(content)
	return "0 translated messages."
end

return M
