if status is-interactive
    # Commands to run in interactive sessions can go here
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
