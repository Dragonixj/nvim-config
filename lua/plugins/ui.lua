return {

	{

		"folke/zen-mode.nvim",
		opts = {

			kitty = {
				enabled = false,
				font = "+4",
			},
		},
	},

	--      wilder
	{
		"gelguy/wilder.nvim",
		enabled = false,
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
					-- 'single', 'double', 'rounded' or 'solid'
					max_height = "50%",
					min_height = "0",
					pumblend = 0,
					border = "rounded",
					prompt_position = "bottom",
					reverse = 0,
				}))
			)
		end,
	},

	{ "romainl/vim-cool" },

	{ "xiyaowong/nvim-transparent" },

	{ "psliwka/vim-smoothie" },
}