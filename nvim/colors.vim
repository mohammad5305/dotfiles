set background=dark

colorscheme gruvbox
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'
hi CmpItemMenuDefault guifg=#4e545c
hi Normal guibg=None
hi ColorColumn ctermbg=0 guibg=grey
hi SignColumn guibg=none
hi CursorLineNR guibg=None
" highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
hi TelescopeBorder guifg=#5eacd
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" hi ColorColumn guibg=gray
" lua require('colorbuddy').colorscheme('gruvbuddy')


