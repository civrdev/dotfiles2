return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-------------------------------------------------------------
			-- Цвета
			-------------------------------------------------------------
			local colors = {
				bg      = '#15161E',
				fg      = '#C0CAF5',
				red     = '#F7768E',
				magenta = '#FF007C',
				green   = '#9ECE6A',
				blue    = '#89DDFF',
				orange  = '#FF9E64',
			}

			-------------------------------------------------------------
			-- Тема
			-------------------------------------------------------------
			local theme = {
				normal = {
					a = { fg = colors.bg, bg = colors.green, gui = "bold" },
					b = { fg = colors.green, bg = colors.bg, gui = "bold" },
					c = { fg = colors.green, bg = colors.bg, gui = "bold" },
				},
				inactive = {
					a = { fg = colors.bg, bg = colors.green, gui = "bold" },
					b = { fg = colors.green, bg = colors.bg, gui = "bold" },
					c = { fg = colors.green, bg = colors.bg, gui = "bold" },
				},
				insert = {
					a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
					b = { fg = colors.blue, bg = colors.bg, gui = "bold" },
					c = { fg = colors.blue, bg = colors.bg, gui = "bold" },
				},
				visual = {
					a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
					b = { fg = colors.magenta, bg = colors.bg, gui = "bold" },
					c = { fg = colors.magenta, bg = colors.bg, gui = "bold" },
				},
				replace = {
					a = { fg = colors.bg, bg = colors.red, gui = "bold" },
					b = { fg = colors.red, bg = colors.bg, gui = "bold" },
					c = { fg = colors.red, bg = colors.bg, gui = "bold" },
				},
				command = {
					a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
					b = { fg = colors.orange, bg = colors.bg, gui = "bold" },
					c = { fg = colors.orange, bg = colors.bg, gui = "bold" },
				},
			}

			-------------------------------------------------------------
			-- Настройка lualine
			-------------------------------------------------------------
			require("lualine").setup({
				options = {
					theme = theme,
					icons_enabled = true,
					component_separators = { left = "/", right = "\\" },
					section_separators = { left = "", right = "" },

					disabled_filetypes = { statusline = {}, winbar = {} },
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,

					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16,
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},

				sections = {
					lualine_a = {},
					lualine_b = {
						"mode",
						"filename",
						"hostname",
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						},
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {
						{
							"filetype",
							icon_only = true,
							colored = false,
							color = function()
								local m = vim.fn.mode()
								if m == "n" then
									return { fg = colors.green }
								elseif m == "i" then
									return { fg = colors.blue }
								elseif m == "v" or m == "V" or m == "\22" then
									return { fg = colors.magenta }
								elseif m == "R" then
									return { fg = colors.red }
								elseif m == "c" then
									return { fg = colors.orange }
								else
									return { fg = colors.fg }
								end
							end,
						},
						"encoding",
						"location",
					},
					lualine_z = {},
				},

				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}
