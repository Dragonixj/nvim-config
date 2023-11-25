return {
	"rcarriga/nvim-notify",

	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#808080",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "",
				WARN = "",
			},
			timeout = 1500,
		})
		vim.notify = notify
	end,
}