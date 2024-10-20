local subcommands = require("po.command.subcommands")

local m = {}

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
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*", desc = "Po.nvim commands" })
end

return m
