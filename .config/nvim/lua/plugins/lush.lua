return {
  {
	"rktjmp/lush.nvim",

	config = function()
	local lush = require("lush")
	local hsl = lush.hsl

	local colors = {
		bg             = hsl("#15161E"),
		bg2            = hsl("#262838"),
		terminal_black = hsl("#24293B"),
		one_more       = hsl("#2A334A"),
		terminal_bl    = hsl("#38405c"),
		dark3          = hsl("#565f89"),
		dark5          = hsl("#737AA2"),
		fg             = hsl("#C0CAF5"),

		blue1    = hsl("#394B70"),
		blue2    = hsl("#356CE6"),
		blue     = hsl("#7AA2F7"),

		magenta  = hsl("#FF007C"),
		red      = hsl("#E04C67"),
		red      = hsl("#F7768E"),
		orange   = hsl("#FF9E64"),
		yellow   = hsl("#E0AF68"),
		purple   = hsl("#A27BE8"),
		cyan     = hsl("#7DCFFF"),
		teal     = hsl("#1ABC9C"),
		green    = hsl("#9ECE6A"),
		-- magenta_archive = hsl("#F24499"),
}

	local theme = lush(function()
		return {

			--- GENERAL ---
			Normal       { fg = colors.fg, bg = colors.bg },
			NormalNC     { fg = colors.fg, bg = colors.bg },
			Cursor       { fg = colors.bg, bg = colors.fg, gui = "bold" },
			CursorLine   { bg = colors.bg },
			CursorColumn { bg = colors.bg },
			ColorColumn  { bg = colors.bg },
			LineNr       { fg = colors.dark3 },
			CursorLineNr { fg = colors.orange, gui = "italic" },
			Visual       { bg = colors.terminal_black },
			VisualNOS    { bg = colors.terminal_black },
			VertSplit    { fg = colors.bg },
			WinSeparator { fg = colors.terminal_black },
			Folded       { fg = colors.dark3, bg = colors.bg },
			SignColumn   { bg = colors.bg },
			Directory    { fg = colors.cyan, gui = "bold,italic" },
			EndOfBuffer  { fg = colors.bg },
			Whitespace   { fg = colors.terminal_black },
			NonText      { fg = colors.dark3 },
			MatchParen   { fg = colors.magenta, bg = colors.terminal_black, gui = "bold" },
			Search       { bg = colors.orange, fg = colors.bg },
			IncSearch    { bg = colors.yellow, fg = colors.bg },

			-- Messages
			ErrorMsg    { fg = colors.red },
			WarningMsg  { fg = colors.yellow },
			Question    { fg = colors.green },
			MoreMsg     { fg = colors.green },
			ModeMsg     { fg = colors.fg },

			-- Syntax
			Character   { fg = colors.green },
			Comment     { fg = colors.dark3, gui = "italic" },
			Constant    { fg = colors.orange },
			Number      { fg = colors.orange },
			String      { fg = colors.green },
			Todo        { fg = colors.bg, bg = colors.cyan, gui = "bold" },
			Function    { fg = colors.cyan, gui = "bold" },
			Type        { fg = colors.cyan },
			Identifier  { fg = colors.fg },
			Statement   { fg = colors.fg },
			Operator    { fg = colors.fg },
			Keyword     { fg = colors.fg },
			PreProc     { fg = colors.cyan },
			Special     { fg = colors.fg },

			-- Diff
			DiffAdd    { bg = hsl("#20303B") },
			DiffChange { bg = hsl("#2E2E45") },
			DiffDelete { bg = hsl("#3B1E27") },
			DiffText   { bg = hsl("#3C5380") },

			-- Statusline & Tabs
			StatusLine     { fg = colors.fg, bg = colors.bg },
			StatusLineNC   { fg = colors.fg, bg = colors.bg },
			TabLine        { fg = colors.fg, bg = colors.bg },
			TabLineSel     { fg = colors.fg, bg = colors.cyan },
			TabLineFill    { bg = colors.bg },

			-- Popup Menu
			Pmenu      { fg = colors.fg, bg = colors.bg },
			PmenuSel   { fg = colors.bg, bg = colors.blue },
			PmenuThumb { bg = colors.blue1 },
			PmenuSbar  { bg = colors.terminal_black },

			-- LSP
			DiagnosticError  { fg = colors.red },
			DiagnosticWarn   { fg = colors.yellow },
			DiagnosticInfo   { fg = colors.fg },
			DiagnosticHint   { fg = colors.fg },

			DiagnosticVirtualTextError { fg = colors.dark5 },
			DiagnosticVirtualTextWarn  { fg = colors.dark5 },
			DiagnosticVirtualTextInfo  { fg = colors.dark5 },
			DiagnosticVirtualTextHint  { fg = colors.dark5 },

			DiagnosticUnderlineError { sp = colors.red, gui = "underline" },
			DiagnosticUnderlineWarn  { sp = colors.dark5, gui = "underline" },
			DiagnosticUnderlineInfo  { gui = "none" },
			DiagnosticUnderlineHint  { gui = "none" },


			--- TREESITTER ---
			["@variable"]           = { fg = colors.fg },
			["@variable.member"]    = { fg = colors.fg },
			["@variable.builtin"]   = { fg = colors.fg },
			["@parameter"]          = { fg = colors.fg },
			["@property"]           = { fg = colors.fg },
			["@field"]              = { fg = colors.fg },
			["@string"]             = { fg = colors.green },
			["@character"]          = { fg = colors.green },
			["@boolean"]            = { fg = colors.orange },
			["@number"]             = { fg = colors.orange },
			["@constant"]           = { fg = colors.orange },
	
			["@function"]           = { fg = colors.cyan },
			["@function.builtin"]   = { fg = colors.cyan },
			["@method"]             = { fg = colors.cyan },
			["@constructor"]        = { fg = colors.cyan },
	
			["@type"]               = { fg = colors.fg },
			["@type.builtin"]       = { fg = colors.fg },
	
			["@lsp.type.variable"]  = { fg = colors.fg },
			["@lsp.type.property"]  = { fg = colors.fg },
			["@lsp.type.parameter"] = { fg = colors.fg },
			["@lsp.type.field"]     = { fg = colors.fg },
			["@lsp.type.type"]      = { fg = colors.fg },
			["@lsp.type.function"]  = { fg = colors.cyan },
			["@lsp.type.method"]    = { fg = colors.cyan },
	

			--- OIL ---
			OilNormal    { fg = colors.fg, bg = colors.bg },
			FloatBorder  { fg = colors.cyan, bg = colors.bg },
			NormalFloat  { fg = colors.fg,  bg = colors.bg },
			Title        { fg = colors.cyan, gui = "bold" },
	

			--- BLINK ---
			BlinkCmpMenu          { fg = colors.fg, bg = colors.bg },
			BlinkCmpMenuBorder    { fg = colors.cyan, bg = colors.bg },
			BlinkCmpMenuSelection { fg = colors.bg, bg = colors.blue },
	
			BlinkCmpScrollBar        { bg = colors.terminal_black },
			BlinkCmpScrollBarThumb   { bg = colors.blue },
	
			BlinkCmpKindText          { fg = colors.cyan },
			BlinkCmpKindMethod        { fg = colors.blue },
			BlinkCmpKindFunction      { fg = colors.blue },
			BlinkCmpKindConstructor   { fg = colors.orange },
			BlinkCmpKindField         { fg = colors.teal },
			BlinkCmpKindVariable      { fg = colors.teal },
			BlinkCmpKindClass         { fg = colors.yellow },
			BlinkCmpKindInterface     { fg = colors.yellow },
			BlinkCmpKindModule        { fg = colors.purple },
			BlinkCmpKindProperty      { fg = colors.teal },
			BlinkCmpKindUnit          { fg = colors.cyan },
			BlinkCmpKindValue         { fg = colors.green },
			BlinkCmpKindEnum          { fg = colors.orange },
			BlinkCmpKindKeyword       { fg = colors.purple },
			BlinkCmpKindSnippet       { fg = colors.red },
			BlinkCmpKindColor         { fg = colors.green },
			BlinkCmpKindFile          { fg = colors.blue },
			BlinkCmpKindReference     { fg = colors.orange },
			BlinkCmpKindFolder        { fg = colors.blue },
			BlinkCmpKindEnumMember    { fg = colors.orange },
			BlinkCmpKindConstant      { fg = colors.orange },
			BlinkCmpKindStruct        { fg = colors.yellow },
			BlinkCmpKindEvent         { fg = colors.red },
			BlinkCmpKindOperator      { fg = colors.cyan },
			BlinkCmpKindTypeParameter { fg = colors.yellow },
	
			BlinkCmpLabel             { fg = colors.fg },
			BlinkCmpLabelDeprecated   { fg = colors.fg, gui = "strikethrough" },
			BlinkCmpLabelMatch        { fg = colors.yellow, gui = "bold" },
			BlinkCmpLabelDetail       { fg = colors.blue },
		
			BlinkCmpDoc         { fg = colors.fg, bg = colors.bg },
			BlinkCmpDocBorder   { fg = colors.blue, bg = colors.bg },
	
			BlinkCmpSignatureHelp                { fg = colors.yellow },
			BlinkCmpSignatureHelpBorder          { fg = colors.yellow },
			BlinkCmpSignatureHelpActiveParameter { fg = colors.orange, gui = "bold" },
	

        }
	end)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "norg",
				callback = function()
					vim.cmd(string.format([[
					highlight! LineNr guifg=%s guibg=%s
					highlight! CursorLineNr guifg=%s guibg=%s
					]], colors.bg.hex, colors.bg.hex, colors.bg.hex, colors.bg.hex))
				end,
			})

			lush(theme)
			vim.api.nvim_set_hl(0, "@variable",                { fg = colors.fg.hex })
			--- For C ---
			vim.api.nvim_set_hl(0, "@variable.c",              { fg = colors.fg.hex })
			vim.api.nvim_set_hl(0, "@punctuation.bracket.c",   { fg = colors.fg.hex })
			vim.api.nvim_set_hl(0, "@punctuation.delimiter.c", { fg = colors.fg.hex })

			--- ORG-MODE ---
			vim.api.nvim_set_hl(0, "@org.headline.level1", { fg = colors.magenta.hex })
			vim.api.nvim_set_hl(0, "@org.headline.level2", { fg = colors.orange.hex })
			vim.api.nvim_set_hl(0, "@org.headline.level3", { fg = colors.green.hex })
			vim.api.nvim_set_hl(0, "@org.headline.level4", { fg = colors.cyan.hex })
			vim.api.nvim_set_hl(0, "@org.headline.level5", { fg = colors.blue2.hex })
			vim.api.nvim_set_hl(0, "@org.headline.level6", { fg = colors.purple.hex })


			vim.api.nvim_set_hl(0, "@org.bullet.org", { fg = colors.terminal_bl.hex })
			vim.api.nvim_set_hl(0, "@org.checkbox.org", { fg = colors.terminal_bl.hex })
			vim.api.nvim_set_hl(0, "@org.checkbox.checked.org", { fg = colors.green.hex })

			vim.api.nvim_set_hl(0, "@org.keyword.todo", { fg = colors.cyan.hex, bg = colors.bg.hex })
			vim.api.nvim_set_hl(0, "@org.keyword.done", { fg = colors.green.hex, bg = colors.bg.hex })
			vim.api.nvim_set_hl(0, "@org.timestamp.inactive.org", { fg = colors.terminal_bl.hex })

    end,
  },
}
