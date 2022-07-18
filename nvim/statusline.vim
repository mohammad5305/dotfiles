" git function {{{
function! StatuslineGitBranch()
    if exists("g:git_branch")
        return g:git_branch
    else
        return ''
    endif
endfunction

function! GetGitBranch()
    let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
    let g:git_branch = l:is_git_dir == 'true' ?
        \ system('bash -c "echo -n \"($(git rev-parse --abbrev-ref HEAD 2>/dev/null))\" "') : ''
endfunction

function! LspStatus() abort
    let sl = ''
    if luaeval('vim.lsp.buf.server_ready()')
        let sl.='%#MyStatuslineLSP#E:'
        let sl.='%#MyStatuslineLSPErrors#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Error\")")}'
        let sl.='%#MyStatuslineLSP# W:'
        let sl.='%#MyStatuslineLSPWarnings#%{luaeval("vim.lsp.util.buf_diagnostics_count(\"Warning\")")}'
    else
        let sl.='%#MyStatuslineLSPErrors#off'
    endif
    return sl
endfunction
let &l:statusline = '%#MyStatuslineLSP#LSP '.LspStatus()

autocmd BufEnter * call GetGitBranch()

set statusline =\ 
set statusline +=%f\ 
set statusline +=%m\ 
set statusline +=%{StatuslineGitBranch()}
set statusline +=%=[%l:%L]
set statusline +=%y 

" set winbar=\ %m\ %F

