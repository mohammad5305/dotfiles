call plug#begin('~/.vim/plugged')
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
" Plug 'jeetsukumaran/vim-pythonsense' "************
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'dense-analysis/ale'
" Plug 'majutsushi/tagbar'
Plug 'lepture/vim-jinja'
" Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' 
" Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'moll/vim-bbye'
Plug 'altercation/vim-colors-solarized'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ap/vim-buftabline'
Plug 'ap/vim-css-color'
Plug 'Chiel92/vim-autoformat'
" Plug 'ambv/black'
Plug 'puremourning/vimspector'
" Plug 'mbbill/undotree'
Plug 'mcchrish/nnn.vim'
Plug 'mhinz/vim-startify'
" Plug 'ervandew/supertab'
" Plug 'godlygeek/tabular'
call plug#end()
" theme
"syntax on
colorscheme onedark
" colorscheme gruvbox
set bg=dark
" set
set hidden
set noshowmode
set nu
set relativenumber
set mouse=a 
" sensible
runtime! plugin/sensible.vim
"shortcut for nerdtree
nmap <C-l> :NERDTreeToggle<CR>
" shortcut for comment
nmap <C-_> :Commentary <CR>
vmap <C-_> :Commentary <CR>
" theme lightline
" let g:lightline = {'colorscheme': 'solarized',}
let g:lightline = {'colorscheme': 'onedark',}
set cursorline
" buftabline

nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>
nnoremap <C-o> :enew<CR>
"close buffer
nnoremap <S-w> :Bdelete<CR>

" shortcut for nnn
nnoremap nnn :Np <CR>
" nnn
 " Opens the n³ window in a split
 let g:nnn#layout = 'new' " or vnew, tabnew etc.

 " Or pass a dictionary with window size
 " let g:nnn#layout = { 'left': '~20%' " or right, up, down

 " Floating window (neovim latest and vim with patch 8.2.191)
 " let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight':
 " 'Debug'  }  }


 "
" autoformat
let g:python3_host_prog="/bin/python"
noremap <C-S-f> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'

" leng
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" run python file
nnoremap <silent><F10> :term  python %<CR>

" for undo tree
" nnoremap <F5>UndotreeToggle<CR>
" normal mode
inoremap jk <ESC>  
inoremap kj <ESC>  

"coc config
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
if exists('*complete_info')
		inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
	endif
										 
" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()


"config coc-snippets 
" Use <tab> for trigger snippet expand.
imap <tab> <Plug>(coc-snippets-expand)

"tab for coc snippet
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
		let col = col('.') - 1
			return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

		let g:coc_snippet_next = '<tab>'




"---------------------------------------------------



" startify
let g:startify_bookmarks = [{"c" : "~/code/python"}, {"n" : "~/.config/nvim"}, {"v" : "~/.vimrc"}, {"w" : "~/.config/i3/config"}]
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


