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
    		---@module "ibl":
	},
	-- undo tree
	{
		"mbbill/undotree",
	},
	-- terminal (nvterm)
	{
		"NvChad/nvterm",
	},
	-- manson (lsp)
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            {"mason-org/mason.nvim", opts = {}},
            "neovim/nvim-lspconfig",

        },
    },
	-- mason-nvim-dap (auto-install DAP adapters)
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = { "node2", "python", "bash" },
			automatic_installation = true,
		},
	},
    -- cmp
    {
        'hrsh7th/nvim-cmp',
            dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            }
    },
	-- dap + ui (dapui)	
	{"rcarriga/nvim-dap-ui", dependencies = "mfussenegger/nvim-dap"},
		{"nvim-neotest/nvim-nio"},
		{"mfussenegger/nvim-dap-python"}

})


