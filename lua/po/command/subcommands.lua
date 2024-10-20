local jump = require("po.jump")

return {
	jump = {
		next = jump.forward,
		prev = jump.backward,
	},
}
