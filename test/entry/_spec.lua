describe("fetch_next", function()
	it("fetches the next entry", function()
		vim.cmd("e test/entry/spec.po")

		-- Get the first line
		local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

		assert.equals("msgstr", first_line)
	end)
end)
