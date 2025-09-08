return {
	name = "custom-gcommit",
	dir = vim.fn.stdpath("config") .. "/lua/noobscience/custom",
	config = function()
		local gcommit = require("noobscience.custom.gcommit")
		gcommit.setup()
	end,
}