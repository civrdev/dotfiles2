local wezterm = require 'wezterm'

local config = {}

config.font_size = 12

config.window_padding = {
	left = 4,
	right = 4,
	top = 0,
	bottom = 0,
}

config.enable_scroll_bar = false
config.enable_wayland = true
config.front_end = "OpenGL"

config.colors = {
	foreground = '#7DCFFF',
	background = '#15161E',

	cursor_bg = '#7DCFFF',
	cursor_fg = '#15161E',

	selection_bg = '#252A3C',
	selection_fg = '#24273A',

	ansi = {
		'#15161E',
		'#E04C67',
		'#9ECE6A',
		'#E0AF68',
		'#356CE6',
		'#BB9AF7',
		'#7DCFFF',
		'#C0CAF5',
	},

	brights = {
		'#414868',
		'#FF899D',
		'#9FE044',
		'#FABA4A',
		'#8DB0FF',
		'#C7A9FF',
		'#A4DAFF',
		'#C0CAF5',
	},

	indexed = {
		[16] = '#FF9E64',
		[17] = '#DB4B4B',
	},

	compose_cursor = '#C0CAF5',
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 10000

config.scrollback_lines = 10000

config.default_prog = { "/bin/zsh", "-l" }

config.window_decorations = "NONE"
config.window_background_opacity = 1.0

config.animation_fps = 60
config.max_fps = 144
config.front_end = "WebGpu"

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config
