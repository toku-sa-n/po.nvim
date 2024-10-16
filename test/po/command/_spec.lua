require("po.command").setup()

describe(":Po jump next", function()
	it("should exist", function()
		vim.cmd("Po jump next")
	end)
end)
