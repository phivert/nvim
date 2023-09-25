vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)

	use('williamboman/mason-lspconfig.nvim')
	use('neovim/nvim-lspconfig')
	use('hrsh7th/cmp-nvim-lsp')
	use('L3MON4D3/LuaSnip')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
	}

end)
