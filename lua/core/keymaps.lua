local map = vim.keymap.set

-- leader key
-- nnoremap <SPACE> <Nop>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save changes
map("n", "ss", "<cmd>w!<cr>")

-- easy align
map("v", "ga", "<Plug>(EasyAlign)", {})
map("n", "ga", "<Plug>(EasyAlign)", {})

-- exit
map("n", "q", "<cmd>qa<cr>")
