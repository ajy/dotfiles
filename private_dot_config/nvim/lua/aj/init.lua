require("aj.remap")
require("aj.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"--branch=stable", -- remove this if you want to bootstrap to HEAD
	"https://github.com/folke/lazy.nvim.git",
	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
	"nvim-telescope/telescope.nvim",
	dependencies = {
	    'nvim-lua/plenary.nvim',
	}
    },
    {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate'
    },

    {'simnalamburt/vim-mundo'},

    {'tpope/vim-vinegar'},

    {'tpope/vim-abolish'}, -- Use for Subvert and Coercion

    {'tpope/vim-fugitive'},
    -- {'tpope/vim-rhubarb'}, -- TODO: Test this out
    {
	'lewis6991/gitsigns.nvim',
	config = function()
	    require('gitsigns').setup()
	end
    },

    {'tpope/vim-sleuth'},

    -- Replacement for tpope/vim-surround
    {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
	    require("nvim-surround").setup({
		-- Configuration here, or leave empty to use defaults
	    })
	end
    },

    -- Comment support
    {
	'numToStr/Comment.nvim',
	dependencies = {
	    'JoosepAlviste/nvim-ts-context-commentstring',  -- Handle tsx and jsx file comments
	},
	config = function()
	    require('Comment').setup({
		pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	    })
	end
    },

    {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
	config = function()
	    require("lualine").setup({
		-- Configuration here, or leave empty to use defaults
	    })
	end
    },

    -- the colorscheme should be available when starting Neovim
    {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
	    -- load the colorscheme here
	    vim.cmd([[colorscheme tokyonight]])

	end,
    },

    {
	'j-hui/fidget.nvim',
	config = function()
	    require"fidget".setup{}
	end,
    },

    {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
	    -- LSP Support
	    'neovim/nvim-lspconfig',
	    'williamboman/mason.nvim',
	    'williamboman/mason-lspconfig.nvim',

	    -- Autocompletion
	    'hrsh7th/nvim-cmp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'saadparwaiz1/cmp_luasnip',
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-nvim-lua',

	    -- Snippets
	    'L3MON4D3/LuaSnip',
	    'rafamadriz/friendly-snippets',

	    -- Custom
	    {
		'folke/neodev.nvim',
		config = function ()
		    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
		    require("neodev").setup({
			-- add any options here, or leave empty to use the default settings
		    })
		end
	    },
	}
    },

    {
	url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
	    require("lsp_lines").setup()
	end,
    },

    {
	"folke/trouble.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
	    require("trouble").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	    }
	end
    }

}

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
	vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

require("lazy").setup(plugins)
