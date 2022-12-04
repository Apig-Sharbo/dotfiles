local packer = require('packer')

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Completion
  use "neovim/nvim-lspconfig"
  use 'hashivim/vim-terraform'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-path' -- Path completion
  use 'hrsh7th/cmp-omni' -- Omnifunc completion
  use 'hrsh7th/cmp-buffer'

  -- use { 'romgrk/fzy-lua-native', run = 'make' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'mfussenegger/nvim-lint'

  -- Themes
  use 'ellisonleao/gruvbox.nvim'

  -- Comments
  use 'tpope/vim-commentary'

  -- Vim motion highlighting
  use { 'unblevable/quick-scope', disable = false }

  -- CSS colors highlight
  use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

end)
