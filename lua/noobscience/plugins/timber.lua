return {
	"Goose97/timber.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("timber").setup({
			log_templates = {
				default = {
					elixir = [[Logger.info("#{%log_target}")]],
				},
			},
		})
	end,
}
