-- Install the package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
-- Plugins -----
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' },
    {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
    {"ThePrimeagen/harpoon", branch = "harpoon2", dependencies =  {"nvim-lua/plenary.nvim"}},
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {'Lucas-Bruschi/gruber-darker-darker.nvim',
        opts = {
            bold = true,
            invert = {
                signs = false,
                tabline = false,
                visual = false,
            },
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
            undercurl = true,
            underline = true,
        }
    },
    {'VonHeikemen/lsp-zero.nvim',
       dependencies = {
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
    },
})
