vim.g.mapleader = ' '

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.o.wrap           = true
		vim.keymap.set('n', 'j', 'gj', { buffer = true, silent = true })
		vim.keymap.set('n', 'k', 'gk', { buffer = true, silent = true })
		vim.keymap.set('v', 'j', 'gj', { buffer = true, silent = true })
		vim.keymap.set('v', 'k', 'gk', { buffer = true, silent = true })
	end,
})


-- FOLD HEADING
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.MarkdownFold(v:lnum)"
		vim.opt_local.foldlevelstart = 99
		vim.opt_local.foldenable = true
		vim.opt_local.foldtext = "v:lua.MarkdownFoldText()"
		vim.opt_local.fillchars:append({ eob = " ", fold = " ", foldopen = "", foldclose = "" })
		vim.cmd("silent! normal! zx")
	end,
})

function _G.MarkdownFold(lnum)
	local line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
	if not line or line == "" then
		return "="
	end

	local hashes = line:match("^%s*(#+)%s")
	if hashes then
		return ">" .. tostring(#hashes)
	end

	local next_lnum = lnum + 1
	local next_line = vim.api.nvim_buf_get_lines(0, next_lnum - 1, next_lnum, false)[1]
	while next_line and next_line:match("^%s*$") do
		next_lnum = next_lnum + 1
		next_line = vim.api.nvim_buf_get_lines(0, next_lnum - 1, next_lnum, false)[1]
	end

	if next_line then
		local next_hashes = next_line:match("^%s*(#+)%s")
		if next_hashes then
			local next_level = #next_hashes
			return string.rep("=", next_level)
		end
	end

	return "="
end

function _G.MarkdownFoldText()
	local line = vim.fn.getline(vim.v.foldstart)
	if not line or line == "" then
		line = "[пусто]"
	end

	line = line:gsub("^%s+", "")

	local level = line:match("^(#+)")
	level = level and #level or 1

	local hl = ({
		[1] = "RenderMarkdownH1Bg",
		[2] = "RenderMarkdownH2Bg",
		[3] = "RenderMarkdownH3Bg",
		[4] = "RenderMarkdownH4Bg",
		[5] = "RenderMarkdownH5Bg",
		[6] = "RenderMarkdownH6Bg",
	})[level] or "RenderMarkdownH1Bg"

	return {
		{ line, hl },
		{ " ...", "FoldDots" },
	}
end

vim.keymap.set('n', '<leader>b', 'za', { noremap = true, silent = true })


-- TOGGLE CHECKBOX MD
vim.g.mapleader = ' '

local checkboxes = {
	["[ ]"] = "[x]",
	["[x]"] = "[/]",
	["[/]"] = "[!]",
	["[!]"] = "[~]",
	["[~]"] = "[+]",
	["[+]"] = "[ ]",
}

local function cycle_checkbox()
	local line = vim.api.nvim_get_current_line()
	local col = vim.fn.col('.')
	local new_line = line

	for k, v in pairs(checkboxes) do
		if line:find(vim.pesc(k)) then
			new_line = line:gsub(vim.pesc(k), v, 1)
			break
		end
	end

	if new_line ~= line then
		vim.api.nvim_set_current_line(new_line)
		vim.fn.cursor(0, col)
	end
end

vim.keymap.set('n', '<leader>c', cycle_checkbox)


-- HEADING MD
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.MarkdownFold(v:lnum)"
		vim.opt_local.foldlevelstart = 99
		vim.opt_local.foldenable = true
		vim.opt_local.foldtext = "v:lua.MarkdownFoldText()"
		vim.opt_local.fillchars:append({ eob = " ", fold = " ", foldopen = "", foldclose = "" })
		vim.cmd("silent! normal! zx")
	end,
})

function _G.MarkdownFold(lnum)
	local line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
	if not line or line == "" then
		return "="
	end

	local hashes = line:match("^%s*(#+)%s")
	if hashes then
		return ">" .. tostring(#hashes)
	end

	local next_lnum = lnum + 1
	local next_line = vim.api.nvim_buf_get_lines(0, next_lnum - 1, next_lnum, false)[1]
	while next_line and next_line:match("^%s*$") do
		next_lnum = next_lnum + 1
		next_line = vim.api.nvim_buf_get_lines(0, next_lnum - 1, next_lnum, false)[1]
	end

	if next_line then
		local next_hashes = next_line:match("^%s*(#+)%s")
		if next_hashes then
			local next_level = #next_hashes
			return string.rep("=", next_level)
		end
	end

	return "="
end

function _G.MarkdownFoldText()
	local line = vim.fn.getline(vim.v.foldstart)
	if not line or line == "" then
		line = "[пусто]"
	end

	line = line:gsub("^%s+", "")

	local level = line:match("^(#+)")
	level = level and #level or 1

	local hl = ({
		[1] = "RenderMarkdownH1Bg",
		[2] = "RenderMarkdownH2Bg",
		[3] = "RenderMarkdownH3Bg",
		[4] = "RenderMarkdownH4Bg",
		[5] = "RenderMarkdownH5Bg",
		[6] = "RenderMarkdownH6Bg",
	})[level] or "RenderMarkdownH1Bg"

	return {
		{ line, hl },
		{ " ...", "FoldDots" },
	}
end

vim.keymap.set('n', 'za', 'za', { noremap = true, silent = true })



-- CLIPBOARD --
vim.o.clipboard = 'unnamedplus'
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd("SourcePost", {
	pattern = "*",
	command = "nohlsearch",
})


-- BLOCK ARROWS --
local modes = { 'n', 'i', 'v' }
local opts = { noremap = true, silent = true }

for _, mode in ipairs(modes) do
	vim.api.nvim_set_keymap(mode, '<Up>', '<Nop>', opts)
	vim.api.nvim_set_keymap(mode, '<Down>', '<Nop>', opts)
	vim.api.nvim_set_keymap(mode, '<Left>', '<Nop>', opts)
	vim.api.nvim_set_keymap(mode, '<Right>', '<Nop>', opts)
end


-- YANKING HIGHLIGHT --
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('Highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
