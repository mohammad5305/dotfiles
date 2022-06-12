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
    # set fish_pager_color_description B3A06D yellow
end

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

source ~/.config/shell/alias


set --universal fish_greeting
set fish_key_bindings fish_user_key_bindings

source ~/.config/fish/conf.d/tokyo.fish
#theme_gruvbox dark medium

bind \t 'if not status -P ; commandline -f complete; end'

function fish_mode_prompt; end

set __fish_git_prompt_color_branch red

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end
