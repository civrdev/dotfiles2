-- AUTOPAIRS --
local function autopair(open, close)
	return function()
		local col = vim.fn.col(".")
		local line = vim.fn.getline(".")

		local cur = line:sub(col, col)
		local after = line:sub(col)

		local open_count = select( 2, after:gsub(vim.pesc(open), ""))
		local close_count = select( 2, after:gsub(vim.pesc(close), ""))

		if cur == close then
			return "<Right>"
		end

		if close_count > open_count then
			return open
		end

		return open .. close .. "<Left>"
	end
end

local function autopair_bs()
	local col = vim.fn.col(".")
	local line = vim.fn.getline(".")

	if col > 1 then
		local prev_char = line:sub(col - 1, col - 1)
		local next_char = line:sub(col, col)

		local pairs = {
			["{"] = "}",
			["("] = ")",
			["["] = "]",
			['"'] = '"',
			["'"] = "'",
			["`"] = "`",
		}

		if pairs[prev_char] == next_char then
			return "<Del><BS>"
		end

		local before2 = line:sub(col - 2, col - 2)
		if pairs[before2] == prev_char then
			return "<BS><BS>"
		end
	end

	return "<BS>"
end


vim.keymap.set("i", "(", autopair("(", ")"), { expr = true })
vim.keymap.set("i", "[", autopair("[", "]"), { expr = true })
vim.keymap.set("i", "{", autopair("{", "}"), { expr = true })
vim.keymap.set("i", '"', autopair('"', '"'), { expr = true })
vim.keymap.set("i", "'", autopair("'", "'"), { expr = true })
vim.keymap.set("i", "`", autopair("`", "`"), { expr = true })
vim.keymap.set("i", "<BS>", autopair_bs, { expr = true })

