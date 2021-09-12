#! /bin/bash
for item in `ls .`
do
    cp -r $item ~/.config/
done

pacman -S rofi nnn ranger mpd dunst mpc ncmpcpp compton lxsession feh neovim nemo zsh 
xrdb ~/.config/.Xresoures
nvim +:PlugInstall

