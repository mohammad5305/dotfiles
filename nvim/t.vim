" terminal app runner
augroup runner
	au!
	autocmd BufEnter *.js let runner='node'
	autocmd BufEnter *.py let runner='python'
augroup END

nnoremap <F10> :exe ":split term://".runner." %"<CR>



inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u

augroup netrw_setup | au!
	au FileType netrw nmap <buffer> l <CR>
	au FileType netrw nmap <buffer> <-> :call ToggleNetrw()<CR>
	au FileType netrw nmap <buffer> h -
augroup END



source ~/.config/nvim/statusline.vim

source ~/.config/nvim/abrev.vim
