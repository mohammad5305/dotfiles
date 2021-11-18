call plug#begin("~/.config/nvim/autoload/plugged")
    " color and icon
    Plug 'ryanoasis/vim-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'tjdevries/colorbuddy.vim'
    Plug 'tjdevries/gruvbuddy.nvim'
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
    " buffer stuff
    Plug 'rbgrouleff/bclose.vim'
    Plug 'ap/vim-buftabline'
    " lsp
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim' 
    Plug 'nvim-lua/lsp-status.nvim'
    " File Explorer
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mcchrish/nnn.vim'
    " telescope stuff
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " status line
    Plug 'tjdevries/express_line.nvim'
    " onestatus
    " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    " latex
    Plug 'xuhdev/vim-latex-live-preview'
    " other stuff
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'lepture/vim-jinja'
    Plug 'sheerun/vim-polyglot'
    Plug '907th/vim-auto-save'
    Plug 'sbdchd/neoformat'
    Plug 'psf/black'
    Plug 'szw/vim-maximizer'
    Plug 'gryf/pylint-vim'
    Plug 'alvan/vim-closetag'
    Plug 'tweekmonster/startuptime.vim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'mbbill/undotree'
    " Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['html', 'python'] }
call plug#end() 

" luafile ~/.config/nvim/lsp.lua
" luafile ~/.config/nvim/completion.lua
luafile ~/.config/nvim/treesitter.lua
luafile ~/.config/nvim/statusline.lua
luafile ~/.config/nvim/nvimtree.lua
luafile ~/.config/nvim/cmp.lua
" luafile ~/.config/nvim/test.lua
" luafile ~/.config/nvim/galaxyline.lua


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

" clipboard
set clipboard=unnamedplus

" line number
set relativenumber                      
set number                              

" theme and background
set background=dark                    

colorscheme gruvbox
let g:gruvbox_invert_selection='0'
hi CmpItemMenuDefault guifg=#4e545c

" hi ColorColumn guibg=gray
" lua require('colorbuddy').colorscheme('gruvbuddy')


" tab stuff
set expandtab                           
set smarttab                            

" python terminal
nnoremap <F10> :split term://python % <CR>
nnoremap <F11> :split term://zsh <CR>
" pylint 
nnoremap <F2> :!pylint % <CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" buffer stuff
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>
nnoremap <Leader>o :enew<CR>
nnoremap <Leader>w :Bclose<CR>


" neoformat map
nnoremap <C-A-f> :Neoformat<CR>


" telescope find_files
nnoremap <silent><Leader>tf :Telescope find_files <CR>
nnoremap <silent><Leader>tg :Telescope git_files <CR>

" closetag 
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" colorize plug
lua require'colorizer'.setup()

" Truble plugin
nnoremap <leader>xx <cmd>TroubleToggle<cr>

" enable AutoSave on Vim startup
let g:auto_save = 0
augroup ft_python
  au!
  au FileType python let b:auto_save = 1
augroup END

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>

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
" Opens the n³ window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down 

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.7, 'highlight': 'Debug' } }
" shortcut for nnn
nnoremap <Leader>n:Np <CR>

"shortcut for nvimtree
nnoremap <C-l> :NvimTreeToggle<CR>


" shortcut for comment
nnoremap <C-_> :Commentary <CR>
vnoremap <C-_> :Commentary <CR>
inoremap <C-_> <ESC>:Commentary <CR>

" latex preview
let g:livepreview_previewer = 'evince'


 " startify
 let g:startify_bookmarks = [{"c" : "~/code/python"}, {"n" : "~/.config/nvim"}, {"v" : "~/.vimrc"}, {"w" : "~/.config/i3/config"},  {"t" : "/tmp/test.py"}, {"z" : "~/.config/zsh/.zshrc"}, {"T" : "~/code/python/test.py"}, {"f" : "~/.config/fish/config.fish"}]
let s:header = [
      \ '',
   \ '██████  ██    ██ ███████ ███████ ██    ██     ██    ██ ██ ███    ███ ',
   \ '██   ██ ██    ██ ██      ██       ██  ██      ██    ██ ██ ████  ████ ',
   \ '██████  ██    ██ ███████ ███████   ████       ██    ██ ██ ██ ████ ██ ',
   \ '██      ██    ██      ██      ██    ██         ██  ██  ██ ██  ██  ██ ',
   \ '██       ██████  ███████ ███████    ██          ████   ██ ██      ██ ',
   \ '                                                                     ',
   \ '',
   \ '',
      \ '',
      \ ]



function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let g:startify_custom_header = s:center(s:header)
let g:startify_padding_left = 5

