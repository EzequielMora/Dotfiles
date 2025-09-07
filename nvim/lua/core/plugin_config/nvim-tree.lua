vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
  hijack_netrw = true,
  disable_netrw = false,
  view = {
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


print("Cargando nvim-tree.lua")

