return {
	"Wansmer/langmapper.nvim",
	lazy = false,
	priority = 1,

	opts = {
		map_all_ctrl = true,
		ctrl_map_modes = { "n", "o", "i", "c", "t", "v" },
		hack_keymap = true,
		disable_hack_modes = { "i" },
		automapping_modes = { "n", "v", "x", "s" },

		default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]`]],

		layouts = {
			ru = {
				id = "ru",
				layout = [[ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё]],
			},
		},
	},

	config = function(_, opts)
		require("langmapper").setup(opts)

		local function escape(str)
			local escape_chars = [[;,."|\]]
			return vim.fn.escape(str, escape_chars)
		end

		local en        = [[qwertyuiop[]asdfghjkl;zxcvbnm,.]]
		local ru        = [[йцукенгшщзхъфывапролджячсмитьбю]]
		local en_shift  = [[QWERTYUIOP{}ASDFGHJKL:ZXCVBNM<>]]
		local ru_shift  = [[ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЯЧСМИТЬБЮ]]

		vim.o.langmap = table.concat({
			escape(ru_shift) .. ";" .. escape(en_shift),
			escape(ru) .. ";" .. escape(en),
		}, ",")

		require("langmapper").hack_get_keymap()
	end,
}
