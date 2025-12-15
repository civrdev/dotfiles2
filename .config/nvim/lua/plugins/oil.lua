return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},

		opts = {
			columns = { "icon" },

			view_options = {
				show_hidden = false,
				show_banner = true,
				preview = true,
				indent_size = 2,
			},

			keymaps = {
				["<CR>"]  = "actions.select",
				["-"]     = "actions.parent",
				["g."]    = "actions.toggle_hidden",
				["<C-r>"] = "actions.refresh",
			},

			float = {
				padding = 0,
				max_width = 50,
				max_height = 22,
				border = "rounded",
			},

			win_options = {
				winhighlight = "Normal:OilNormal,CursorLine:OilCursorLine",
			},

			default_file_explorer = true,
			delete_to_trash = false,
			follow_current_file = true,
			show_hidden_on_startup = true,
			restore_cursor_position = true,
			skip_confirm_for_simple_edits = true,

			preview = {
				enabled = true,
				width = 120,
				height = 80,
				wrap = true,
			},

			sort_options = {
				method = "name",
				ascending = true,
				folders_first = true,
			},

			buffer_options = {
				signcolumn = "no",
				buflisted = true,
				swapfile = false,
				bufhidden = "wipe",
				filetype = "oil",
			},

			lsp_file_operations = {
				enable = false,
			},
		},

		config = function(_, opts)
			require("oil").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "oil",
				callback = function()
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
					vim.opt_local.signcolumn = "no"
					vim.opt_local.foldcolumn = "0"
				end,
			})
		end,
	},
}
