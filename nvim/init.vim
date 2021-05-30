source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug/plugins.vim
source $HOME/.config/nvim/plug/quickscope.vim
source $HOME/.config/nvim/plug/lspconfig.vim
luafile ~/.config/nvim/plug/galaxyline/galaxyline.lua
luafile ~/.config/nvim/plug/compe-config.lua
luafile ~/.config/nvim/plug/pythonlsp/pythonlsp.lua
luafile ~/.config/nvim/plug/treesitter.lua

" colorscheme gruvbox


" lua 
lua << EOF
-- require'lspconfig'.python.setup{on_attach=require'completion'.on_attach}
-- require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
-- for galexy
EOF



" theme
" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "c++" },  -- list of language that will be disabled
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

