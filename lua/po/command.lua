local m = {}

local subcommands = {
	["jump next"] = {
		function()
			print("Jumping to next")
		end,
	},
}

---@param opts { fargs: string[] }
local function po_handler(opts)
	local args = table.concat(opts, " ")

	if subcommands[args] then
		subcommands[args]()
	else
		print("Unknown subcommand: " .. args)
	end
end

function m.setup()
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*" })
end

return m
