call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'mcchrish/nnn.vim'
    " auto format
    Plug 'jiangmiao/auto-pairs'
    Plug 'Chiel92/vim-autoformat'
    Plug 'sbdchd/neoformat'
    " snippet
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'
    " icon
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons' 
    " buffer stuff
    Plug 'romgrk/barbar.nvim'
    Plug 'rbgrouleff/bclose.vim'
    " lsp
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim' 
    " colorscheme
    Plug 'gruvbox-community/gruvbox'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " python
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    " debuger
    Plug 'mfussenegger/nvim-dap'
    " other
    Plug 'unblevable/quick-scope'
    Plug 'tpope/vim-commentary'
    Plug 'szw/vim-maximizer'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'tweekmonster/startuptime.vim'
    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'pechorin/any-jump.vim'
    Plug '907th/vim-auto-save'
call plug#end()
