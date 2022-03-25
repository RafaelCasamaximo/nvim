local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
	use "kyazdani42/nvim-web-devicons"
  	use "kyazdani42/nvim-tree.lua"
	use 'shaunsingh/nord.nvim'
	use "akinsho/bufferline.nvim"

  	-- cmp plugins
  	use "hrsh7th/nvim-cmp"
  	use "hrsh7th/cmp-buffer"
  	use "hrsh7th/cmp-path"
  	use "hrsh7th/cmp-cmdline"
  	use "hrsh7th/cmp-nvim-lsp"
	-- snippets
  	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"
 	use "saadparwaiz1/cmp_luasnip"
	-- Treesitter
  	use {
    	"nvim-treesitter/nvim-treesitter",
    	run = ":TSUpdate",
  	}
  	use "windwp/nvim-ts-autotag"
  	use "windwp/nvim-autopairs"
  	use "p00f/nvim-ts-rainbow"
  	use "nvim-treesitter/nvim-treesitter-refactor"

  	use "JoosepAlviste/nvim-ts-context-commentstring"
  	use "numToStr/Comment.nvim"
 	-- LSP
  	use "neovim/nvim-lspconfig"
  	use "williamboman/nvim-lsp-installer"

	-- Alpha Dashboard
	use "goolord/alpha-nvim"

	-- Rose Pine Theme
	use({
    	'rose-pine/neovim',
   		as = 'rose-pine',
    	tag = 'v1.*',
    	config = function()
        	vim.cmd('colorscheme rose-pine')
    	end
	})
	-- LuaLine
	use "nvim-lualine/lualine.nvim"

	if PACKER_BOOTSTRAP then
		require "packer".sync()
	end
end)

