local m = {}

local function handle_jump_next()
	vim.fn.cursor(13, 8)
end

local subcommands = {
	["jump next"] = handle_jump_next,
}

local function show_error_message(args)
	local msg = "Unknown subcommand: Po " .. table.concat(args, " ")

	vim.api.nvim_err_writeln(msg)
end

---@param opts { fargs: string[] }
local function po_handler(opts)
	local args = table.concat(opts.fargs, " ")

	if subcommands[args] then
		subcommands[args]()
	else
		show_error_message(opts.fargs)
	end
end

function m.setup()
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*", description = "Po.nvim commands" })
end

return m
