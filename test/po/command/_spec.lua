require("po.command").setup()

describe("Po command", function()
	it("should exist", function()
		local commands = vim.api.nvim_get_commands({})

		assert.not_nil(commands["Po"])
	end)
end)

describe(":Po jump next", function()
	it("should exist", function()
		vim.cmd("Po jump next")
	end)
end)
