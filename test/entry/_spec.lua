describe("fetch_next", function()
	it("fetches the next entry", function()
		vim.cmd("e test/entry/spec.po")

		local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
		assert.equals(1, cursor_line)
	end)
end)
