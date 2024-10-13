local statistics = require("po.statistics")
local async = require("plenary.async")

async.tests.describe("fetch", function()
	async.tests.it("fetches the statistics text of the given po file content.", function()
		local actual = statistics.fetch("test/statistics/ja.po", "C")

		assert.equals("0 translated messages.", actual)
	end)
end)
