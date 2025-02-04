-- Bootstrap LazyVim (install Lazy.nvim plugin manager)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  -- Lazily install lazy.nvim if it's not already installed
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim', lazypath
	})
end

-- Add LazyVim to the runtime path
vim.opt.runtimepath:prepend(lazypath)

-- Use LazyVim plugins
require('lazy').setup({
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},
	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- tree explorer (texplorer)
	{
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons"
	},
	-- theme
	{
		'projekt0n/github-nvim-theme',
		name = 'github-theme'
	},
	-- autopairs
	{
    		'windwp/nvim-autopairs',
    		event = "InsertEnter",
    		config = true
	},
	-- indent tracker (ibl)
	{
    		"lukas-reineke/indent-blankline.nvim",
    		main = "ibl",
    		---@module "ibl"
	},
	-- undo tree
	{
		"mbbill/undotree",
	},
	-- terminal (nvterm)
	{
		"NvChad/nvterm",
	},
	-- lsp zero (manson)
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies =
		{
		      --- manage LSP servers
		      'williamboman/mason.nvim',
		      'williamboman/mason-lspconfig.nvim',
		      -- LSP Support
		      'neovim/nvim-lspconfig',
		      -- Autocompletion
		      'hrsh7th/nvim-cmp',
		      'hrsh7th/cmp-nvim-lsp',
		      'L3MON4D3/LuaSnip',
		}
	},
	-- dap + ui (dapui)	
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap"
	},
		{
			"nvim-neotest/nvim-nio"
		},
		{
			"mfussenegger/nvim-dap-python"
		}

})


