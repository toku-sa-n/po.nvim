local async = require("plenary.async")
local statistics = require("po.statistics")

local M = require("lualine.component"):extend()
local statusline = ""

function M:init(options)
	M.super.init(self, options)
end

function M.update_status(_)
	local filepath = vim.api.nvim_buf_get_name(0)
	if filepath == "" then
		return ""
	end

	local extension = vim.fn.fnamemodify(filepath, ":e")

	if extension ~= "po" then
		return ""
	end

	async.void(function()
		local s = statistics.fetch(filepath, vim.env.LANG)

		if s ~= nil then
			statusline = s
		end
	end)()

	return statusline
end

return M
