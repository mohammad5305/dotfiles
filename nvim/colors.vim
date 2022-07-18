colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
set bg=dark

" if strftime("%H") < 15  && strftime("%H") > 11
"     set bg=light
" else
"     set bg=dark
"     " hi Normal guibg=None
" endif

" hi ColorColumn ctermbg=0 guibg=grey
" colo tokyonight
" hi SignColumn guibg=none
" hi CursorLineNR guibg=None
" highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
hi TelescopeBorder guifg=#5eacd

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
