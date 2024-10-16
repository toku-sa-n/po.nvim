local m = {}

local subcommands = {
	{
		{ "jump", "next" },
		function()
			print("Jumping to next")
		end,
	},
}

local function tables_equal(t1, t2)
	if #t1 ~= #t2 then
		return false
	end

	for i = 1, #t1 do
		if t1[i] ~= t2[i] then
			return false
		end
	end

	return true
end

---@param opts { fargs: string[] }
local function po_handler(opts)
	local args = opts.fargs

	for _, cmd in ipairs(subcommands) do
		local keys, handler = cmd[1], cmd[2]

		if tables_equal(keys, args) then
			handler()
			return
		end
	end

	print("Unknown subcommand")
end

function m.setup()
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*" })
end

return m
