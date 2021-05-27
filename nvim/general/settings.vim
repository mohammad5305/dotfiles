" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set laststatus=0                        " Always display the status line
set relativenumber                      " Line numbers
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

" theme for light line
set laststatus=2
" let g:lightline = {'colorscheme': 'solarized',}
" wakatime
let g:wakatime_PythonBinary = '/usr/bin/python'  " (Default: 'python')


" python
lua << EOF
O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'lunar',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'bash',
    timeoutlen = 100,
    nvim_tree_disable_netrw = 0, -- "1 by default, disables netrw (must be set before plugin's packadd)
     python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
		analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
EOF


" buffers
nnoremap <C-o> :enew<CR>
"close buffer
nnoremap <S-w> :Bclose<CR>


" for get pwd relative_path
set autochdir 
" nnn
" Opens the n³ window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" polygot
let g:polyglot_disabled = ['markdown, rust, c++, c']

