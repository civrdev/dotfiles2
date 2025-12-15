--[[
     HELP:
     https://learnxinyminutes.com/docs/lua/
     :help
     :help lua-guide
     :help vim.keymap.set()
     :Tutor
--]]

--  [setting options]

-- disable filetype.vim loading
-- vim.g.did_load_filetypes = 1
vim.g.formatoptions = 'qrn1'
vim.g.have_nerd_font = true

-- highlight
vim.cmd [[highlight clear LineNr]]
vim.cmd [[highlight clear SignColumn]]

-- general
vim.opt.shortmess:append 'I'
vim.opt.shell = '/bin/zsh'
vim.opt.confirm = true
vim.opt.showmode = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.inccommand = 'split'
vim.opt.virtualedit = 'block'
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- mouse
vim.opt.mouse = 'a'
vim.opt.mousefocus = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- ensure sync with OS
end)

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- scrolling & UI
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.breakindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- list characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '❯·',
  trail = '·',
  nbsp = '␣',
}

-- fill characters
vim.opt.fillchars = {
  vert = '│',
  fold = '⠀',
  eob = ' ',
  msgsep = '‾',
  foldopen = '▾',
  foldsep = '│',
  foldclose = '▸',
}

-- shorter messages
vim.opt.shortmess:append 'c'
