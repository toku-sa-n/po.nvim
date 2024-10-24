local m = {}

local function show_error_message(args)
	local msg = "Unknown subcommand: Po " .. table.concat(args, " ")

	vim.api.nvim_err_writeln(msg)
end

---@param opts { fargs: string[] }
local function po_handler(opts)
	local current_level = require("po.command.subcommands")

	for _, arg in ipairs(opts.fargs) do
		if current_level[arg] then
			current_level = current_level[arg]
		else
			show_error_message(opts.fargs)
			return
		end
	end

	if type(current_level) == "function" then
		current_level()
	else
		show_error_message(opts.fargs)
	end
end

function m.setup()
	local completion = require("po.command.completion")

	vim.api.nvim_buf_create_user_command(
		0, -- Current buffer
		"Po",
		po_handler,
		{ nargs = "*", desc = "Po.nvim commands", complete = completion.complete }
	)
end

return m
