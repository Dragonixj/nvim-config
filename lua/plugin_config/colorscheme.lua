local lualine = require("lualine")

local colorscheme = require("gruvbox")

colorscheme.setup({
	options = {
		transparent = true,
	},
})

lualine.setup({
	options = {
		theme = "auto",
		transparent = true,
	},
})

vim.cmd([[ colorscheme rose-pine ]])

vim.o.termguicolors = true
