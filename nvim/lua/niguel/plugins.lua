vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!

  -- lushwal
  use({
    "oncomouse/lushwal",
    requires = { { "rktjmp/lush.nvim", opt = true }, { "rktjmp/shipwright.nvim", opt = true } },
  })

  -- tree sitter
  --use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- harpoon
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }


  -- alpha nvim - ui greeter
  use {
      'goolord/alpha-nvim',
  }

  -- pywal nvim
  use {
      'AlphaTechnolog/pywal.nvim',
      as = 'pywal'
  }

  use {
      'mbrea-c/wal-colors.nvim'
  }

  -- LSP
  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use({'williamboman/mason.nvim'})
  use({"williamboman/mason-lspconfig.nvim"})
  use({'mfussenegger/nvim-jdtls'})
end)
