return {

	"romgrk/barbar.nvim",
	config = function()
		local bar = require("barbar")
		local diagnostic = vim.diagnostic --for cleanliness
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		bar.setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			focus_on_close = "left",
			transparent = true,

			-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
			hide = { extensions = true, inactive = false },

			-- Disable highlighting alternate buffers
			highlight_alternate = false,

			-- Disable highlighting file icons in inactive buffers
			highlight_inactive_file_icons = false,

			-- Enable highlighting visible buffers
			highlight_visible = true,

			icons = {
				-- Configure the base icons on the bufferline.
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[diagnostic.severity.ERROR] = { enabled = true, icon = " " },
					[diagnostic.severity.WARN] = { enabled = true, icon = " " },
					[diagnostic.severity.INFO] = { enabled = true, icon = " " },
					[diagnostic.severity.HINT] = { enabled = true, icon = " " },
				},
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "車", filename = true, separator = { right = "" } },

				-- Use a preconfigured buffer appearance can be 'default' 'powerline' or 'slanted'
				preset = "default",

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},

			-- If true, new buffers will be inserted at the start/end of the list.
			-- Default is to insert after current buffer.
			insert_at_end = false,
			insert_at_start = false,

			-- Sets the maximum padding width with which to surround each tab
			maximum_padding = 1,

			-- Sets the minimum padding width with which to surround each tab
			minimum_padding = 1,

			-- Sets the maximum buffer name length.
			maximum_length = 30,

			-- If set, the letters for each buffer in buffer-pick mode will be
			-- assigned based on their name. Otherwise or in case all letters are
			-- already assigned, the behavior is to assign letters in order of
			-- usability (see order below)
			semantic_letters = true,

			-- Set the filetypes which barbar will offset itself for
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = { text = "undotree" },
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify both
				Outline = { event = "BufWinLeave", text = "symbols-outline" },
			},

			-- New buffer letters are assigned in this order. This order is
			-- optimal for the qwerty keyboard layout but might need adjustment
			-- for other layouts.
			letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

			-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
			-- where X is the buffer number. But only a static string is accepted here.
			no_name_title = nil,
		})

		-- Move to previous/next
		map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
		-- Re-order to previous/next
		map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
		map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
		-- Goto buffer in position...
		map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
		-- Pin/unpin buffer
		map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
		-- Close buffer
		map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
		map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
		-- Sort automatically by...
		map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
		map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
		map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
		map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
	end,
}
