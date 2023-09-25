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
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'nvim-treesitter/nvim-treesitter'
	use 'williamboman/mason.nvim'
	use 'hrsh7th/nvim-cmp'

---- plugins
  use('nvim-tree/nvim-tree.lua') ---- tree explorer
  use('nvim-tree/nvim-web-devicons') ---- icons
  use('projekt0n/github-nvim-theme') ---- theme
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.3'} ---- telescope
  use("NvChad/nvterm") --- terminal
  use('folke/neodev.nvim') ---- autocomplete

  if packer_bootstrap then
    require('packer').sync()
  end
end)
