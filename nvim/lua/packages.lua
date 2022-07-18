local use = require('packer').use
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require "colorizer".setup() end
    }
    use 'kyazdani42/nvim-web-devicons'

    use { "gruvbox-community/gruvbox" }
    use 'folke/tokyonight.nvim'


    -- lsp stuff
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use({'onsails/lspkind.nvim'})
    use 'hrsh7th/cmp-path'
    use 'ray-x/cmp-treesitter'
    use 'hrsh7th/cmp-nvim-lua'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- buffer stuff
    -- use 'ap/vim-buftabline'

    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'

    -- telescope stuff
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'junegunn/fzf'
    use 'zackhsi/fzf-tags'
    
    
    -- other stuff
    use {
        'windwp/nvim-autopairs',
        config = function () require('nvim-autopairs').setup{} end
    }

    use 'preservim/vim-litecorrect'

    use 'tpope/vim-commentary'
    use 'vimwiki/vimwiki'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'lepture/vim-jinja'
    -- use 'gryf/pylint-vim'
    use {
        'windwp/nvim-ts-autotag',
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'mbbill/undotree'
    use 'ThePrimeagen/harpoon'
    use 'gregsexton/MatchTag'
    use 'tpope/vim-fugitive'

end)
