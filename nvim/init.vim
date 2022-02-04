call plug#begin("~/.config/nvim/autoload/plugged")
    " color and icon
    Plug 'ryanoasis/vim-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'gruvbox-community/gruvbox'
    " snippet
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/cmp-path'
    Plug 'ray-x/cmp-treesitter'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'
    " csharp
    Plug 'OmniSharp/omnisharp-vim'
    " buffer stuff
    " Plug 'ap/vim-buftabline'
    " lsp
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    " File Explorer
    " Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mcchrish/nnn.vim'
    " telescope stuff
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " status line
    Plug 'tjdevries/express_line.nvim'
    " other stuff
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'lepture/vim-jinja'
    Plug 'sheerun/vim-polyglot'
    " Plug '907th/vim-auto-save'
    Plug 'sbdchd/neoformat'
    Plug 'psf/black'
    Plug 'szw/vim-maximizer'
    Plug 'gryf/pylint-vim'
    Plug 'alvan/vim-closetag'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-surround'
    Plug 'ThePrimeagen/harpoon'
    " Plug 'andymass/vim-matchup'
    " Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['html', 'python'] }
call plug#end()

" normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" setting
let mapleader="\<Space>"
set scrolloff=5
set shortmess+=c
syntax on
set laststatus=2
set noshowmode
set noswapfile
set backspace=indent,eol,start
set autoindent
set shiftwidth=4
set splitbelow
set termguicolors
set nowrap
set nohls
set smartindent
set undofile
set hidden
set formatoptions-=cro
set colorcolumn=90

" csharp
let g:OmniSharp_server_stdio = 1

" clipboard
set clipboard=unnamedplus

" line number
set relativenumber
set number

" theme and background
source ~/.config/nvim/colors.vim

" tab stuff
set expandtab
set smarttab

" python terminal
nnoremap <F10> :split term://python % <CR>
" pylint
nnoremap <F2> :!pylint % <CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" buffer stuff
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>
nnoremap <Leader>o :enew<CR>
nnoremap <Leader>w :bdelete<CR>

" neoformat map
nnoremap <C-A-f> :Neoformat<CR>

" python formtter
augroup python_formmater
  au!
  if executable("black")
      au BufEnter *.py	setlocal formatexpr=
      au BufEnter *.py	setlocal formatprg=black\ -q\ -
  endif
augroup END

" ale options
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black'],}

" telescope find_files
nnoremap <silent><Leader>tf :Telescope find_files <CR>
nnoremap <silent><Leader>tg :Telescope git_files <CR>

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" cmp
" set completeopt=menu,menuone,noselect

" toggle maximzer
nnoremap <silent><A-m> :MaximizerToggle<CR>

" nice maps
nnoremap Y y$

" nice moving
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" nnn
let g:nnn#layout = 'new'

let g:nnn#layout = { 'left': '~20%' }

let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.7, 'highlight': 'Debug' } }
nnoremap <Leader>n:Np <CR>

"shortcut for nvimtree
" nnoremap <C-l> :NvimTreeToggle<CR>
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

nnoremap <C-l> :call ToggleNetrw() <CR>


" shortcut for comment
nnoremap <C-_> :Commentary <CR>
vnoremap <C-_> :Commentary <CR>
inoremap <C-_> <ESC>:Commentary <CR>

" netrw
augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
    au FileType netrw nmap <buffer> h -
augroup END
let g:netrw_winsize=40

" latex preview
" let g:livepreview_previewer = 'evince'


augroup oldfiles
    autocmd!
    autocmd FileType qf if get(w:, 'quickfix_title') =~# 'Oldfiles' | nnoremap <buffer> <silent> <CR> <CR>:cclose<CR> | endif
augroup END



augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END



lua << EOF
require("luasnip/loaders/from_vscode").lazy_load()
require "lsp"
-- require "nvimtree"
require "statusline"
require "treesitter"
require "colorizer".setup()
EOF

source ~/.config/nvim/startify.vim
source ~/.config/nvim/harpoon.vim
