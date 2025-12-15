return {
	{
	'saghen/blink.cmp',

	version = '1.*',

	opts = {
		keymap = {
			preset = "default"
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = { scrollbar = false },
			documentation = { auto_show = true },
		},

		sources = {
			default = { "lsp", "path" },
		},

		fuzzy = {
			implementation = "lua",
		}
	},

	opts_extend = { "sources.default" }

	}
}
