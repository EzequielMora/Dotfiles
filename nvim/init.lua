require("core.options")
require("core.keymaps")
require("core.plugins")

-- Configuración individual de plugins
-- require("core.plugin_config.gruvbox") -- ❌ esta línea sobra
-- require("core.plugin_config.gruvbox_material") -- opcional, solo si tenés ese archivo
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")

-- Configuración básica de nvim-jdtls para Java
local nvim_lsp = require('lspconfig')

nvim_lsp.jdtls.setup{
  cmd = {'jdtls'},
  on_attach = function(client, bufnr)
    local buf_map = function(mode, lhs, rhs)
      local opts = { noremap=true, silent=true, buffer=bufnr }
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  end,

  root_dir = nvim_lsp.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
}

-- Opciones del tema
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_better_performance = 1

-- Aplicar el tema
vim.cmd("colorscheme gruvbox-material")

