local fn = vim.fn

-- Auto Install Packer (fn.stdpath > site/pack/packer/start/) --
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

-- Error Protection --
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

-- Popup Window for Packer --
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = 'rounded' }
		end,
	},
}

return packer.startup(function(use)
	use {
		'wbthomason/packer.nvim', -- Packer Manager

		-- Cosmetics --
		'nvim-lualine/lualine.nvim',       -- Status Line Theme
		'akinsho/bufferline.nvim',         -- Tab Bar Theme
		'kyazdani42/nvim-web-devicons',    -- Icon Dictionary
		'lukas-reineke/indent-blankline.nvim', -- Indent Line

		-- Utilities --
		'lewis6991/impatient.nvim', -- Speedup Loading Neovim
		'kyazdani42/nvim-tree.lua', -- TreeView File Explorer
		'folke/which-key.nvim', -- Which-key hotkey manager
		'tpope/vim-fugitive',   -- Git for Nvim
		'windwp/nvim-autopairs', -- Enables Autopairs
		'nvim-lua/plenary.nvim', -- Common Libraries
		'numToStr/Comment.nvim', -- Commenting Engine

		-- Treesitter & Dependencies--
		'nvim-treesitter/nvim-treesitter', -- Syntax Coloring Engine
		run = 'TSUpdate',

		-- Telescope & Dependencies --
		'nvim-telescope/telescope.nvim',          --Telescope Fuzzy Finder
		'nvim-telescope/telescope-file-browser.nvim', -- Telescope File Browser

		-- LSP & Dependencies --
		'williamboman/mason.nvim',       -- Language Server Installer
		'williamboman/mason-lspconfig.nvim', -- Bridge between mason & lspconfig
		'neovim/nvim-lspconfig',         -- Built-in LSP Config
		'glepnir/lspsaga.nvim',          -- LSP UI Enhancement

		-- CMP & Dependencies --
		'hrsh7th/cmp-nvim-lsp', -- LSP Source for Autocompletion
		'hrsh7th/nvim-cmp', -- Autocomplete Engine
		'hrsh7th/cmp-buffer',
		'onsails/lspkind-nvim', -- Suggestion Icons
		'L3MON4D3/LuaSnip', -- Snippet Engine
	}
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
