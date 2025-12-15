-- GENERAL --
vim.o.number         = true
vim.o.relativenumber = true
vim.o.cursorline     = true
vim.o.cursorline     = true
vim.o.termguicolors  = true
vim.o.hidden         = true
vim.o.undofile       = true
vim.g.have_nerd_font = true
vim.o.confirm        = true
vim.o.ignorecase     = true
vim.o.hlsearch       = true
vim.o.incsearch      = true
vim.o.wrap           = false
vim.o.laststatus     = 0
vim.o.swapfile       = false
vim.o.showmode       = false
vim.o.expandtab      = false
vim.o.shiftwidth     = 2
vim.o.tabstop        = 2
vim.o.softtabstop    = 2
vim.o.scrolloff      = 23
vim.opt.fillchars    = vim.opt.fillchars + { eob = " " }
vim.o.shell          = '/usr/bin/zsh'
vim.o.langmap        = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.completeopt  = { 'menu', 'menuone', 'noselect', 'popup' }
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append 'c'
vim.opt.shortmess:append 'I'
vim.opt.winborder   = "rounded"
vim.o.signcolumn    = "no"
vim.g.formatoptions = 'qn1'
vim.o.concealcursor = "nc"
vim.opt.list        = true
vim.opt.listchars   = {
	trail = "·",
	tab   = "··"
}


-- KEYMAPS --
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>q', ':silent quit<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', ':silent restart<CR>', { silent = true })
vim.keymap.set('n', '<ESC>', ':silent nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', ':silent write<CR>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true })

-- PLUGINS keymaps --
vim.keymap.set('n', '<leader>f', ':Pick files<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { silent = true })

vim.keymap.set('n', '<leader>e', ':silent Oil --float<CR>', { silent = true })
vim.keymap.set('n', '<leader>vd', ':silent Oil --float /home/civr/dcs/vault<CR>', { silent = true })
vim.keymap.set('n', '<leader>vn', ':silent Oil --float /home/civr/.config/nvim<CR>', { silent = true })


-- LAZY --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	change_detection = {
		enabled = false,
		notify = false,
	},
	spec = {
		{ import = "plugins" },
	},
})

require "config.autocommands"
require "config.autopairs"
require "config.terminal"
