local M = require("lualine.component"):extend()

function M:init(options)
	M.super.init(self, options)

	self.options = {
		message = "foo",
	}
end

function M:update_status()
	return "Foo"
end

return M
