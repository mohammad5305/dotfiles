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
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"

# fix end and home button
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line

# alias and export
alias ls="ls --color=auto"
alias vpn="sudo protonvpn c -f"
alias vpn-off="sudo protonvpn d"
alias dns-g="echo nameserver 8.8.8.8 | sudo tee -a /etc/resolv.conf"
alias dns-c="echo nameserver 4.2.2.4 | sudo tee -a /etc/resolv.conf"


# subsearch
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# autocomplete
fpath=(~/.config/zsh/plugin/zsh-completions/src $fpath)
autoload -U compinit && compinit
zstyle ':completion:*' menu select
# reverse with shift+tab
bindkey '^[[Z' reverse-menu-complete

# git info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[yellow]%} %{$fg[magenta]%}%b%{$fg[blue]%})"
PROMPT+="\$vcs_info_msg_0_ "
