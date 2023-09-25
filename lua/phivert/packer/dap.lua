vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)

	use('mfussenegger/nvim-dap')
	use('jay-babu/mason-nvim-dap.nvim')
	use('rcarriga/nvim-dap-ui')
	use('mfussenegger/nvim-dap-python')

end)
