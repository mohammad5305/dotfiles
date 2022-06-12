function git::is_repo
	test -d .git; or command git rev-parse --git-dir >/dev/null 2>&1
end

function git::branch_name
	git::is_repo; and begin
		command git symbolic-ref --short HEAD 2>/dev/null;
		or command git show-ref --head -s --abbrev | head -n1 2>/dev/null
	end
end

function git_stuff
    if git::is_repo
		set set -l branch (git::branch_name 2>/dev/null)
        echo (set_color blue)" git:("(set_color red)(git::branch_name)(set_color blue)")"
        
    end
end
function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status --background=red white

    # write pipestatus
    # if the status was carried over (e.g. after `set`), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    # git 


    # echo -n -s (set_color green) (prompt_pwd) $normal  (set_color blue) (git_stuff) $normal " "$prompt_status $suffix " "
    echo -n -s (set_color green)"➜ "(set_color cyan)  (prompt_pwd) $normal  (set_color blue) (git_stuff) $normal " "$prompt_status $suffix " "
end
