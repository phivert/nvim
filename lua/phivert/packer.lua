local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use "wbthomason/packer.nvim" --- packer
  use{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } --- treesitter
	use{ "nvim-telescope/telescope.nvim", tag = "0.1.3", requires = "nvim-lua/plenary.nvim" } --- telescope
  use{ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" } ---- tree explorer
  use "projekt0n/github-nvim-theme" ---- theme
  use "windwp/nvim-autopairs" ---- auto pairs
	use "lukas-reineke/indent-blankline.nvim" ---- indent tracker
print("sd")
 	use "aserowy/tmux.nvim" --- tmux 
	use { 
    --- lsp zero
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
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
  }

  use{ --- dap + ui
    "rcarriga/nvim-dap-ui",
    requires = "mfussenegger/nvim-dap"
    }
  use "mfussenegger/nvim-dap-python" --- python dap

  if packer_bootstrap then
    require('packer').sync()
  end
  end)
