-- TERMINAL --
local term_buf = nil
local term_height = 32
local term_width = 85

local aug = vim.api.nvim_create_augroup("User_FloatTerm", { clear = true })

local function calc_config(width, height)
	local ui = vim.api.nvim_list_uis()[1] or { width = vim.o.columns, height = vim.o.lines }

	local cmdh = tonumber(vim.o.cmdheight) or 1
	local laststatus = tonumber(vim.o.laststatus) or 2
	local bottom_reserved = cmdh + ((laststatus == 0) and 0 or 1)

	local usable_height = ui.height - bottom_reserved
	if usable_height < 1 then usable_height = 1 end

	if height > usable_height then
		height = usable_height
	end

	local row = math.floor((usable_height - height) / 2)
	if row < 0 then row = 0 end

	local col = math.floor((ui.width - width) / 2)
	if col < 0 then col = 0 end

	return {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
		zindex = 200,
	}
end

local function open_term_win(buf)
	local cfg = calc_config(term_width, term_height)
	return vim.api.nvim_open_win(buf, true, cfg)
end

vim.keymap.set({ 'n', 'i', 't' }, '<C-`>', function()
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		local wins = vim.fn.win_findbuf(term_buf)
		if #wins > 0 then
			vim.api.nvim_win_hide(wins[1])
			return
		else
			local twin = open_term_win(term_buf)
			if twin then
				vim.api.nvim_set_current_win(twin)
				vim.cmd("startinsert")
			end
			return
		end
	end

	term_buf = vim.api.nvim_create_buf(false, false)
	local twin = open_term_win(term_buf)
	if twin then
		vim.api.nvim_win_call(twin, function()
			vim.cmd("terminal")
		end)
		vim.api.nvim_set_current_win(twin)
		vim.cmd("startinsert")
	end
end, { desc = "Toggle centered floating terminal (20x50), not overlapping lualine" })

vim.api.nvim_create_autocmd("TermClose", {
	group = aug,
	callback = function(ev)
		if term_buf == ev.buf then
			term_buf = nil
		end
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	group = aug,
	callback = function()
		if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then return end
		local wins = vim.fn.win_findbuf(term_buf)
		if #wins == 0 then return end
		local winid = wins[1]
		local cfg = calc_config(term_width, term_height)
		pcall(vim.api.nvim_win_set_config, winid, cfg)
	end,
})
