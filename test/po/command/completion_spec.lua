local completion = require("po.command.completion")

local function assert_completion(expected, arg_lead, cmd_line)
	local completions = completion.complete(arg_lead, cmd_line)

	assert.are.same(expected, completions)
end

describe("po.command.completion.complete", function()
	it("suggests `jump` after `:Po `", function()
		assert_completion({ "jump" }, "", "Po ")
	end)

	it("suggests `jump` after `:Po j`", function()
		assert_completion({ "jump" }, "j", "Po j")
	end)

	it("suggests `prev` and `next` after `:Po jump `", function()
		assert_completion({ "next", "prev" }, "", "Po jump ")
	end)

	it("suggests `prev` after `:Po jump p`", function()
		assert_completion({ "prev" }, "p", "Po jump p")
	end)

	it("suggests nothing after `:Po jump next `", function()
		assert_completion({}, "", "Po jump next ")
	end)
end)
