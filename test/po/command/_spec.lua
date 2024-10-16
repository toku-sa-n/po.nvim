require("po.command").setup()

describe(":Po jump next", function()
	before_each(function()
		vim.cmd("e test/po/command/ja.po")

		vim.fn.cursor(1, 1)
		assert.are.same({ 1, 1 }, { vim.fn.line("."), vim.fn.col(".") })
	end)

	it("should exist", function()
		vim.cmd("Po jump next")
	end)

	it("jumps to the next untranslated entry", function()
		vim.cmd("Po jump next")

		assert.are.same({ 13, 8 }, { vim.fn.line("."), vim.fn.col(".") })
	end)
end)
