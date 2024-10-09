describe("fetch_statistics_text", function()
	it("fetches the statistics text of the given po file content.", function()
		local content = [[
msgid ""
msgstr ""
"Content-Type: text/plain; charset=UTF-8\n"
        ]]

		assert.equals("0 translated messages.", require("po.statistics").fetch_statistics_text(content))
	end)
end)
