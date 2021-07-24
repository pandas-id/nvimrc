local M = {}

function M.config()
  local colors = require("colors.gruvbox")
  vim.g.better_whitespace_ctermcolor  = 'red'
  vim.g.better_whitespace_guicolor    = colors.red
end

return M
