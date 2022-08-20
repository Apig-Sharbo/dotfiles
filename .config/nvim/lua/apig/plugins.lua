local packer = require('packer')

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Completion
  use("neovim/nvim-lspconfig")
  use 'hashivim/vim-terraform'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'mfussenegger/nvim-lint'

  -- Themes
  use 'ellisonleao/gruvbox.nvim'

  -- Comments
  use 'tpope/vim-commentary'

  -- Vim motion highlighting
  use {'unblevable/quick-scope', disable = false}

  -- CSS colors highlight
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

end)
