vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width                 = 25
vim.g.nvim_tree_ignore                = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_gitignore             = 1
vim.g.nvim_tree_auto_ignore_ft        = { 'startify', 'dashboard' }
vim.g.nvim_tree_auto_open             = 0
vim.g.nvim_tree_auto_close            = 1
vim.g.nvim_tree_quit_on_open          = 0
vim.g.nvim_tree_follow                = 1
vim.g.nvim_tree_indent_markers        = 1
vim.g.nvim_tree_hide_dotfiles         = 1
vim.g.nvim_tree_git_hl                = 1
vim.g.nvim_tree_root_folder_modifier  = ':~'
vim.g.nvim_tree_tab_open              = 1
vim.g.nvim_tree_width_allow_resize    = 1
vim.g.nvim_tree_disable_netrw         = 1
vim.g.nvim_tree_hijack_netrw          = 1
vim.g.nvim_tree_hijack_cursor         = 0
vim.g.nvim_tree_add_trailing          = 0
vim.g.nvim_tree_group_empty           = 0
vim.g.nvim_tree_lsp_diagnostics       = 0
vim.g.nvim_tree_icon_padding          = ' '
vim.g.nvim_tree_update_cwd            = 1
vim.g.nvim_tree_disable_window_picker = 1

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '',
    deleted = '-',
    ignored = '^'
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = ''
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = ''
  }
}
