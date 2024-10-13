local line_navigator = require("po.line_navigator")

describe("po.line_navigator", function()
	describe("new", function()
		it("returns a new instance", function()
			assert.not_nil(line_navigator.new())
		end)
	end)
end)
