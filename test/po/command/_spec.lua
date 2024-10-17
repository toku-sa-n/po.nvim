require("po.command").setup()

local function assert_cursor_position(line, col)
	assert.are.same({ line, col }, { vim.fn.line("."), vim.fn.col(".") })
end

describe(":Po jump next", function()
	before_each(function()
		vim.cmd("e test/po/command/ja.po")
	end)

	it("jumps to the next untranslated entry", function()
		vim.fn.cursor(1, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(13, 8)
	end)

	it("jumps to another untranslated entry after the first jump", function()
		vim.fn.cursor(1, 1)

		vim.cmd("Po jump next")
		vim.cmd("Po jump next")

		assert_cursor_position(16, 8)
	end)

	it("jumps to the next untranslated entry with comments", function()
		vim.fn.cursor(16, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(19, 8)
	end)
end)
