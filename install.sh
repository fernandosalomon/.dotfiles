#!/bin/bash

#Before executing this script set the HOME_DIR variable to your home directory
HOME_DIR='/home/ffsalomon'

#ln -s $HOME_DIR/.dotfiles/eww $HOME_DIR/.config/eww
ln -s $HOME_DIR/.dotfiles/hypr $HOME_DIR/.config/hypr
rm -r $HOME_DIR/.config/kitty
ln -s $HOME_DIR/.dotfiles/kitty $HOME_DIR/.config/kitty
ln -s $HOME_DIR/.dotfiles/nvim $HOME_DIR/.config/nvim
ln -s $HOME_DIR/.dotfiles/rofi $HOME_DIR/.config/rofi
ln -s $HOME_DIR/.dotfiles/swaync $HOME_DIR/.config/swaync
ln -s $HOME_DIR/.dotfiles/wallpapers $HOME_DIR/.config/wallpapers
ln -s $HOME_DIR/.dotfiles/waybar $HOME_DIR/.config/waybar
ln -s $HOME_DIR/.dotfiles/zsh $HOME_DIR/.config/zsh
ln -s $HOME_DIR/.dotfiles/.p10k.zsh $HOME_DIR/.p10k.zsh
