require("po.command").setup()

describe(":Po jump next", function()
	it("should exist", function()
		vim.cmd("Po jump next")
	end)

	it("jumps to the next untranslated entry", function()
		vim.cmd("e test/po/command/ja.po")

		assert.are.same({ 1, 1 }, { vim.fn.line("."), vim.fn.col(".") })

		vim.cmd("Po jump next")

		assert.are.same({ 13, 8 }, { vim.fn.line("."), vim.fn.col(".") })
	end)
end)
