-- This file can be loaded by calling `lua require('aj.packer')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                          , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use('simnalamburt/vim-mundo')
  use('tpope/vim-vinegar')

  use('tpope/vim-abolish') -- Use for Subvert and Coercion

  use('tpope/vim-fugitive')
  -- use('tpope/vim-rhubarb') -- TODO: Test this out

  -- Replacement for tpope/vim-surround
  use({
	  "kylechui/nvim-surround",
	  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	  config = function()
		  require("nvim-surround").setup({
			  -- Configuration here, or leave empty to use defaults
		  })
	  end
  })

  -- Comment support
  use('JoosepAlviste/nvim-ts-context-commentstring') -- Handle tsx and jsx file comments
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup({
			  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
		  })
	  end
  }

  use({
	  "lukas-reineke/indent-blankline.nvim",
	  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	  config = function()
		  require("indent_blankline").setup({
			  -- Configuration here, or leave empty to use defaults
		  })
	  end
  })

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	  config = function()
		  require("lualine").setup({
			  -- Configuration here, or leave empty to use defaults
		  })
	  end
  }

  use 'folke/tokyonight.nvim'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use({
	  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	  config = function()
		  require("lsp_lines").setup()
	  end,
  })
end)
