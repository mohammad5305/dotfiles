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


