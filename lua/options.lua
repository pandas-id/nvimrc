local opt = vim.opt
local o = vim.o
local g = vim.g

o.laststatus = 3
o.showmode = false
o.showcmd = false

o.clipboard = "unnamedplus"
o.cursorline = true
-- o.cursorlineopt = "number"

-- indentasi
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true
opt.autoindent = true

opt.fillchars = { eob = " " }
o.ignorecase = true -- pencarian caseinsentive
o.smartcase = true
o.mouse = "n"

-- number
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false
o.scrolloff = 10

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"

o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

opt.guicursor = "n-v-c-i:block"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.mapleader = " "
g.maplocalleader = " "
