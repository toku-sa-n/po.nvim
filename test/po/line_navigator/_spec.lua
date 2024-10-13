local line_navigator = require("po.line_navigator")

describe("po.line_navigator", function()
	describe("new", function()
		it("returns a new instance", function()
			assert.not_nil(line_navigator.new())
		end)
	end)

	describe("next", function()
		it("returns the next line", function()
			function get_line(line_number)
				return "line " .. line_number
			end

			local navigator = line_navigator.new(0, get_line)

			assert.equals("line 1", navigator:next())
		end)
	end)
end)
