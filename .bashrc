#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/shell/alias
source ~/.config/shell/env


export HISTFILE=~/.config/shell/history
export HISTSIZE=-1

setxkbmap -option caps:escape &>/dev/null


shopt -s histappend
export prompt_command='history -a'
export histcontrol=ignoredups
export image="sxiv"

# defualt editor
export EDITOR=/usr/local/bin/nvim

. ~/Downloads/programs/z/z.sh
# source ~/.local/bin/git-prompt.sh

__git_ps1(){
    echo $(git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
}

git_info(){
    if [[ $(__git_ps1) ]]
    then
        printf "git:(%s)" $(__git_ps1)
    fi
}

#PS1='\[\033[01;32m\]➜\[\033[00m\]\[\033[01;34m\] \w\[\033[00m\]\[\033[01;36m\]$(__git_ps1 " git:(\[\033[01;31m\]%s\[\033[00m\])") '
PS1='\w $(git_info)\$ '

# complete doas also
complete -cf doas

bind '"\ei":backward-char'


#  run c 
runC() {
    cc "$1" && ./a.out
}

