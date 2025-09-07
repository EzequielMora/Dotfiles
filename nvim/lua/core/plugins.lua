return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- NvimTree y devicons
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("core.plugin_config.nvim-tree")
    end,
  }

  -- LSP + Java
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-jdtls'

  -- Autocompletado
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Tema Gruvbox Material
  use {
    'sainnhe/gruvbox-material',
    config = function()
      vim.o.termguicolors = true
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd('colorscheme gruvbox-material')
    end
  }

  -- Lualine (barra de estado)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('core.plugin_config.lualine')
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

