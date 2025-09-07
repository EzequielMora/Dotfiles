local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Ctrl+S para guardar
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', opts) 

-- Ejecutar archivo Python con <leader>r (espacio + r)
vim.keymap.set('n', '<leader>r', ':w<CR>:!python3 %<CR>', opts)

-- Ejecutar archivo Java con <leader>j (espacio + j)
vim.keymap.set('n', '<leader>j', ':w<CR>:!javac % && java %:r<CR>', opts)

-- Navegar entre palabras con Ctrl + Flechas (modo insert)
vim.keymap.set('i', '<C-Left>', '<C-\\><C-o>b', opts)
vim.keymap.set('i', '<C-Right>', '<C-\\><C-o>w', opts)

-- Seleccionar texto con Shift + Flechas (modo normal)
vim.keymap.set('n', '<S-Left>', 'v<Left>', opts)
vim.keymap.set('n', '<S-Right>', 'v<Right>', opts)
vim.keymap.set('n', '<S-Up>', 'v<Up>', opts)
vim.keymap.set('n', '<S-Down>', 'v<Down>', opts)

-- Mover selección con Shift + Flechas (modo visual)
vim.keymap.set('v', '<S-Left>', '<Left>', opts)
vim.keymap.set('v', '<S-Right>', '<Right>', opts)
vim.keymap.set('v', '<S-Up>', '<Up>', opts)
vim.keymap.set('v', '<S-Down>', '<Down>', opts)

vim.keymap.set("n", "<F5>", function()
  local file = vim.fn.expand("%:t")
  local classname = vim.fn.expand("%:t:r")
  vim.cmd("w!")  -- fuerza guardar el archivo
  vim.cmd("!javac " .. file .. " && java " .. classname)
end, { noremap = true, silent = true })




vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
