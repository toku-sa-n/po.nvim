local async = require("plenary.async")
local statistics = require("po.statistics")

---@class LualineComponent
---@field public init fun(self: LualineComponent, options: table)

---@class PoComponent : LualineComponent
---@field private super LualineComponent
local m = require("lualine.component"):extend()
local statusline = ""

function m:init(options)
	m.super:init(options)
end

function m.update_status()
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

return m
