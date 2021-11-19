if status is-interactive
    # set -l onedark_options '-b'

    # if set -q VIM
    #     # Using from vim/neovim.
    #     set onedark_options "-256"
    # else if string match -iq "eterm*" $TERM
    #     # Using from emacs.
    #     function fish_title; true; end
    #         set onedark_options "-256"
    #     end

    # set_onedark $onedark_options
end

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block


alias vpn="sudo protonvpn c -f"
alias vpn-off="sudo protonvpn d"
alias rand-bg="feh -z --bg-scale ~/Pictures/anime/"
alias cp="cp -iv"
alias mv="mv -iv"


set --universal fish_greeting
set fish_key_bindings fish_user_key_bindings
theme_gruvbox dark medium

set __fish_git_prompt_color_branch red

