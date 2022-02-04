# Created by newuser for 5.8
autoload -Uz vcs_info
autoload -U colors && colors
setopt menucomplete autocd

# plugin
source ~/.config/zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugin/vim-mode.zsh
source ~/.config/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugin/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugin/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/plugin/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/plugin/zsh-autopair/autopair.zsh

# history stuff
HISTFILE=~/.config/zsh/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# prompt 
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%2~%{$reset_color%}"


# git info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

# zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[yellow]%} %{$fg[magenta]%}%b%{$fg[blue]%})"
zstyle ':vcs_info:git:*' formats " %{$fg_bold[blue]%}git:(%{$fg[red]%}%b%{$fg_bold[blue]%})"
PROMPT+="\$vcs_info_msg_0_ "


# fix end and home button
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line

# alias and export
alias ls="ls --color=auto"
alias vpn="sudo protonvpn c -f"
alias vpn-off="sudo protonvpn d"
alias rand-bg="feh -z --bg-scale ~/Pictures/anime/"
alias cp="cp -iv" \
mv="mv -iv"
alias w_minecraft="wine ~/.wine/drive_c/users/mohammad/Application\ Data/.minecraft/minecraft\ launcher/Minecraft\ Launcher.exe"
alias le="exa"
alias vim="nvim"


# alias exa="exa --header --git --long"


# subsearch
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# autocomplete
fpath=(~/.config/zsh/plugin/zsh-completions/src $fpath)
autoload -U compinit && compinit
zstyle ':completion:*' menu select
# reverse with shift+tab
bindkey '^[[Z' reverse-menu-complete


# robbyrussell theme for git 
# PROMPT+='$reset_color%} $(git_prompt_info)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
