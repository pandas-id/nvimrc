# ⌨️ Neovim Keybindings Cheatsheet

> Leader key: `<Space>`

---

## 📁 File & Buffer

| Keybinding | Action | Source |
|------------|--------|--------|
| `<leader>w` | Save file | mappings |
| `<leader>bd` | Delete buffer | mappings |
| `<leader>bn` | Next buffer | mappings |
| `<leader>bp` | Previous buffer | mappings |
| `-` | Open parent directory (Oil) | oil.nvim |

---

## 🔍 Telescope (Find)

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fb` | Find buffers |
| `<leader>fs` | Find LSP symbols |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |

---

## 🔎 Search & Replace

| Keybinding | Action | Source |
|------------|--------|--------|
| `<leader>sr` | Search and Replace (Spectre) | spectre.nvim |

---

## 🧠 LSP & Code

| Keybinding | Action | Source |
|------------|--------|--------|
| `gd` | Go to definition | lspsaga |
| `gr` | LSP finder (references) | lspsaga |
| `K` | Hover documentation | lspsaga |
| `<leader>ca` | Code action | lspsaga |
| `<leader>rn` | Rename symbol | lspsaga |
| `<leader>o` | Code outline | lspsaga |
| `<leader>e` | Line diagnostics | lspsaga |
| `<leader>D` | Buffer diagnostics | lspsaga |


## 🩺 Diagnostics

| Keybinding | Action | Source |
|------------|--------|--------|
| `[d` | Previous diagnostic | diagnostic |
| `]d` | Next diagnostic | diagnostic |
| `<leader>q` | Open diagnostic list | diagnostic |

---

## 🔀 Git (Gitsigns & Neogit)

| Keybinding | Action | Source |
|------------|--------|--------|
| `gs` | Stage hunk | gitsigns |
| `gu` | Undo stage hunk | gitsigns |
| `gh` | Preview hunk | gitsigns |
| `]h` | Next hunk | gitsigns |
| `[h` | Previous hunk | gitsigns |
| `<leader>gb` | Toggle line blame | gitsigns |
| `<leader>gg` | Open Neogit | neogit |
| `<leader>gc` | Git commit | neogit |
| `<leader>gp` | Git push | neogit |

---

## 📂 File Explorer

| Keybinding | Action | Source |
|------------|--------|--------|
| `-` | Open parent directory | oil.nvim |
| `<C-n>` | Toggle file tree | sfm.nvim |
| `<leader>y` | Open Yazi at current file | yazi.nvim |
| `<leader>cw` | Open Yazi in working directory | yazi.nvim |
| `<C-Up>` | Resume last Yazi session | yazi.nvim |

---

## 🪟 Window Navigation

| Keybinding | Action |
|------------|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |

---

## ✏️ Editing

| Keybinding | Action | Mode |
|------------|--------|------|
| `>` | Indent line | Normal |
| `<` | Outdent line | Normal |
| `>` | Indent selection (keeps selection) | Visual |
| `<` | Outdent selection (keeps selection) | Visual |
| `jk` / `kj` | Escape insert mode | Insert |
| `<Esc>` | Clear search highlight | Normal |

---

## 🚀 Flash (Motion)

| Keybinding | Action | Mode |
|------------|--------|------|
| `s` | Flash jump | n, x, o |
| `S` | Flash treesitter | n, x, o |

---

## 📝 TODOs

| Keybinding | Action | Source |
|------------|--------|--------|
| `]t` | Next TODO | todo-comments |
| `[t` | Previous TODO | todo-comments |
| `<leader>ft` | Find TODOs (Telescope) | todo-comments |

---

## 💬 Noice (Notifications)

| Keybinding | Action |
|------------|--------|
| `<leader>nl` | Last message |
| `<leader>nh` | Message history |
| `<leader>na` | All messages |
| `<leader>nd` | Dismiss all notifications |
| `<C-f>` | Scroll forward (in docs) |
| `<C-b>` | Scroll backward (in docs) |

---

## 🐛 Debugging (DAP)

| Keybinding | Action | Source |
|------------|--------|--------|
| `<leader>db` | Toggle breakpoint | dap |
| `<leader>dc` | Continue | dap |
| `<leader>di` | Step into | dap |
| `<leader>do` | Step over | dap |
| `<leader>du` | Toggle DAP UI | dap |

---

## ▶️ Code Runner

| Keybinding | Action | Source |
|------------|--------|--------|
| `<leader>rr` | Run code | code_runner |
| `<leader>rf` | Run file | code_runner |

---

## 🤖 AI (CodeCompanion)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>cm` | Generate commit (Indonesian) | n, v |

---

## 🔷 Laravel

| Keybinding | Action |
|------------|--------|
| `<leader>ll` | Laravel Picker |
| `<leader>la` | Artisan Picker |
| `<leader>lr` | Routes Picker |
| `<leader>lm` | Make Picker |
| `<leader>lc` | Commands Picker |
| `<leader>lo` | Resources Picker |
| `<leader>lp` | Command Center |
| `<leader>lh` | Documentation |
| `<leader>lt` | Actions Picker |
| `<C-g>` | View Finder |
| `gf` | Go to file (Laravel-aware) |

---

## 📊 Which-Key

| Keybinding | Action |
|------------|--------|
| `<leader>?` | Show buffer local keymaps |

---

## 🎬 Screenkey

| Keybinding | Action |
|------------|--------|
| `<leader>sk` | Toggle Screenkey |

---

## 🔧 Misc

| Keybinding | Action | Source |
|------------|--------|--------|
| `<leader>ac` | Auto commit | mappings |
| `zR` | Open all folds | nvim-ufo |
| `zM` | Close all folds | nvim-ufo |

---

## 🚫 Disabled Keys

| Key | Reason |
|-----|--------|
| Arrow keys | Use `hjkl` instead |
| `<C-z>` | Prevent accidental suspend |

---

## 📝 Notes

- Use `:Telescope keymaps` to search all keybindings
- Use `<leader>?` to see which-key popup
- All keybindings have descriptions visible in which-key

---

*Last updated: January 2026*
