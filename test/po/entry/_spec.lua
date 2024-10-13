describe("fetch_next", function()
	it("fetches the next entry", function()
		vim.cmd("e test/entry/spec.po")

		local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
		assert.equals(1, cursor_line)

		local expected = {
			msgid = "This is a sample text.",
			msgstr = "これはサンプルテキストです。",
		}
		local actual = require("po.entry").fetch_next()

		assert.equals(expected.msgid, actual.msgid)
	end)
end)
