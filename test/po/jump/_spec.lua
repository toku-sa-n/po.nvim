describe("next_untranslated_or_fuzzy", function()
	it("jumps to the closest next untranslated or fuzzy message", function()
		vim.cmd("e test/fixtures/next_untranslated_or_fuzzy.po")

		assert.are.same({ 1, 1 }, { vim.fn.line("."), vim.fn.col(".") })
	end)
end)
