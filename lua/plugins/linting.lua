return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")
		local keymap = vim.keymap
		local lint_aurogroup = vim.api.nvim_create_augroup("lint", { clear = true })

		lint.linters_by_ft = {
			-- python = { "pylint" },
			python = { "flake8" },
			-- javascript = { "biomejs" },
			htmldjango = { "djlint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_aurogroup,
			callback = function()
				lint.try_lint()
			end,
		})

		keymap.set("n", "<leader>lt", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
