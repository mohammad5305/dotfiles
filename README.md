# dotfiles
requirements : 

- st
- polybar
- rofi
- feh
- lxsession
- compton
- mpd
- neovim + vim-plug
- zsh

 
 font : awesome, nerd, JetBrains(for st)
 

 ![image](./wallpaper/dotfiles-1.png)
 ![image](./wallpaper/dotfiles-2.png)
## nvim 
 ![image](./wallpaper/dotfiles-3.png)

 Install vim plug for manage plugins and do `:PlugInstall`

### key mapping
leader key in my config is comma ','

| key map           | Description              |
|-------------------|--------------------------|
| jk, kj            | exit from normal mode    |
| tab , shift + tab | switch between buffers   |
| leader + t        | open Telescope           |
| leader + w        | close buffer             |
| ctrl + /          | comment toggle           |
| nnn               | open nnn                 |
| gs                | go to references (Lsp)   |
| gd                | go to definition (Lsp)   |
| ctrl + alt + f    | format with neoformat    |
| leader + s        | search word under cursor |
| leader + n        | open new buffer          |
| ctrl + l          | open nerd tree           |


## zsh 
Put this into your ~/.xprofile or ~/.profile
```
export ZDOTDIR=$HOME/.config/zsh
export LC_CTYPE=en_US.UTF-8
```

