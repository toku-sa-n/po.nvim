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
		vim.fn.cursor(21, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(24, 8)
	end)

	it("jumps to the next untranslated entry with msgctxt", function()
		vim.fn.cursor(25, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(28, 8)
	end)

	it("jumps to the next plural untranslated entry", function()
		vim.fn.cursor(29, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(32, 11)
	end)

	it("jumps to the next fuzzy entry", function()
		vim.fn.cursor(33, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(37, 8)
	end)

	it("ignores a translated entry with multiple lines of msgstr", function()
		vim.fn.cursor(17, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(24, 8)
	end)

	it("wraps around to the first untranslated entry", function()
		vim.fn.cursor(38, 1)

		vim.cmd("Po jump next")

		assert_cursor_position(13, 8)
	end)
end)

describe(":Po jump prev", function()
	before_each(function()
		vim.cmd("e test/po/command/ja.po")
	end)

	it("should exist", function()
		vim.cmd("Po jump prev")
	end)

	it("jumps to the previous untranslated entry", function()
		vim.cmd("e test/po/command/ja.po")
		vim.fn.cursor(14, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(13, 8)
	end)

	it("jumps to another untranslated entry after the first jump", function()
		vim.fn.cursor(17, 1)

		vim.cmd("Po jump prev")
		vim.cmd("Po jump prev")

		assert_cursor_position(13, 8)
	end)

	it("jumps to the previous untranslated entry with comments", function()
		vim.fn.cursor(25, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(24, 8)
	end)

	it("jumps to the previous untranslated entry with msgctxt", function()
		vim.fn.cursor(29, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(28, 8)
	end)

	it("jumps to the previous plural untranslated entry", function()
		vim.fn.cursor(33, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(32, 11)
	end)

	it("jumps to the previous fuzzy entry", function()
		vim.fn.cursor(38, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(37, 8)
	end)

	it("wraps around to the last untranslated entry", function()
		vim.fn.cursor(21, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(16, 8)
	end)

	it("wraps around to the last fuzzy entry", function()
		vim.fn.cursor(11, 1)

		vim.cmd("Po jump prev")

		assert_cursor_position(37, 8)
	end)
end)
