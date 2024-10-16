local m = {}

local function po_handler(opts)
	if opts.fargs[1] == "jump" and opts.fargs[2] == "next" then
		print("Jumping to next")
	else
		local msg = "Unknown command: Po " .. table.concat(opts.fargs, " ")
		vim.api.nvim_err_writeln(msg)
	end
end

function m.setup()
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*" })
end

return m
