local statistics = require("po.statistics")

describe("fetch", function()
	it("fetches the statistics text of the given po file content.", function()
		assert.equals("0 translated messages.", statistics.fetch("test.po"))
	end)
end)
