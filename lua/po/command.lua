local m = {}

local function jump_to_untranslated_line(line_number)
	vim.cmd("normal! " .. line_number .. 'G0f"')
end

local function jump_to_fuzzy_line(line_number)
	vim.cmd("normal! " .. line_number .. "G0")

	local msgstr_line = vim.fn.search("\\v^msgstr", "wn")

	if msgstr_line == 0 then
		error("`msgstr` line not found")
		return
	end

	vim.cmd("normal! " .. msgstr_line .. 'G0f"')
end

local function handle_jump_next()
	local untranslated_line = vim.fn.search('\\v^msgstr(\\[\\d+\\])?(\\_s*"")+(\\_s*"[^"]+)@!', "wn")
	local fuzzy_line = vim.fn.search("\\v^#, fuzzy", "wn")

	if untranslated_line == 0 and fuzzy_line == 0 then
		print("No entry to jump to.")
		return
	end

	if untranslated_line == 0 then
		jump_to_fuzzy_line(fuzzy_line)
		return
	end

	if fuzzy_line == 0 then
		jump_to_untranslated_line(untranslated_line)
		return
	end

	if
		untranslated_line < vim.fn.line(".") and fuzzy_line < vim.fn.line(".")
		or untranslated_line > vim.fn.line(".") and fuzzy_line > vim.fn.line(".")
	then
		if untranslated_line < fuzzy_line then
			jump_to_untranslated_line(untranslated_line)
		else
			jump_to_fuzzy_line(fuzzy_line)
		end
		return
	end

	if untranslated_line < vim.fn.line(".") then
		jump_to_fuzzy_line(fuzzy_line)
	else
		jump_to_untranslated_line(untranslated_line)
	end
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
	vim.api.nvim_create_user_command("Po", po_handler, { nargs = "*", desc = "Po.nvim commands" })
end

return m
