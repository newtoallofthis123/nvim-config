return {
	name = "custom-cursor-agent",
	dir = vim.fn.stdpath("config") .. "/lua/noobscience/custom",
	config = function()
		local cursor_agent = require("noobscience.custom.cursor-agent")
		cursor_agent.setup()
	end,
}
