call plug#begin("~/.config/nvim/autoload/plugged")
    " color and icon
    Plug 'ryanoasis/vim-devicons'
    Plug 'ap/vim-css-color'
    Plug 'kyazdani42/nvim-web-devicons'
    " theme
    Plug 'joshdick/onedark.vim'
    " snippet
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    " buffer stuff
    Plug 'romgrk/barbar.nvim'
    Plug 'rbgrouleff/bclose.vim'
    " lsp
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim' 
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'mcchrish/nnn.vim'
    " telescope stuff
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " other stuff
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'lepture/vim-jinja'
    Plug 'sheerun/vim-polyglot'
    Plug 'rhysd/vim-grammarous'
    Plug 'skanehira/preview-markdown.vim'
    " Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['html', 'python'] }
    Plug 'voldikss/vim-browser-search'
    Plug 'sbdchd/neoformat'
call plug#end() 

luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/completion.lua
luafile ~/.config/nvim/galaxyline.lua

" normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" setting 
let mapleader=','
set scrolloff=3
set shortmess+=c
syntax on
set laststatus=2                        
set noshowmode
set noswapfile
set backspace=indent,eol,start 
set autoindent
set shiftwidth=4
" mouse and clipboard
set mouse=a
set clipboard=unnamedplus

" line number
set relativenumber                      
set number                              

" theme and background
set background=dark                    
colorscheme onedark

" tab stuff
set smarttab                            
set expandtab                           

" refresh
nnoremap <silent> <F5> :source % <CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" buffer stuff
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>
nnoremap <Leader>n :enew<CR>
nnoremap <Leader>w :Bclose<CR>

" for complete
set completeopt=menuone,noselect

" search faster 
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

" neoformat map
nnoremap <C-A-f> :Neoformat<CR>

" telescope find_files
nnoremap <silent><Leader>t :Telescope find_files <CR>

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
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
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>


" compelte config
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.emoji = v:true

" nnn
" Opens the n³ window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
" shortcut for nnn
nnoremap nnn :Np <CR>

"shortcut for nerdtree
nmap <C-l> :NERDTreeToggle<CR>
" shortcut for comment
nnoremap <C-_> :Commentary <CR>
vnoremap <C-_> :Commentary <CR>
inoremap <C-_> <ESC>:Commentary <CR>

 " startify
let g:startify_bookmarks = [{"c" : "~/code/python"}, {"n" : "~/.config/nvim"}, {"v" : "~/.vimrc"}, {"w" : "~/.config/i3/config"},  {"t" : "~/code/python/test.py"}]
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


