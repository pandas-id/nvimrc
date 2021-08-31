local filetypes = require("utils").filetypes

filetypes({
  cpp        = { shiftwidth=4, tabstop=4, conceallevel=0 },
  html       = { shiftwidth=2, tabstop=2 },
  htmldjango = { shiftwidth=2, tabstop=2 },
  javascript = { shiftwidth=4, tabstop=4},
  json       = { shiftwidth=2, tabstop=2, conceallevel=0 },
  vim        = { shiftwidth=2, tabstop=2, conceallevel=0 },
  python     = { shiftwidth=4, tabstop=4},
  lua        = { shiftwidth=2, tabstop=2, softtabstop=2 },
  php        = { shiftwidth=2, tabstop=2, softtabstop=2 },
  text       = { nonumber=true, norelativenumber=true },
  help       = { nonumber=true, norelativenumber=true },
})

-- ingat posisi terakhir cursor
vim.cmd [[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]]

-- run python script
vim.cmd("autocmd FileType python map <buffer> rr :w<cr>:exec '!python3' shellescape(@%, 1)<cr>")

-- run lua script
vim.cmd("autocmd FileType lua map <buffer> rr :w<cr>:exec '!lua' shellescape(@%, 1)<cr>")
