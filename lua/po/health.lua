local m = {}

local function get_msgfmt_path()
	local msgfmt_path = vim.fn.exepath("msgfmt")

	if msgfmt_path == "" then
		return nil
	end

	return msgfmt_path
end

m.check = function()
	vim.health.start("po.nvim")

	local msgfmt_path = get_msgfmt_path()

	if msgfmt_path == nil then
		vim.health.error("msgfmt not found")
	else
		vim.health.ok("msgfmt found at " .. msgfmt_path)
	end
end

return m
