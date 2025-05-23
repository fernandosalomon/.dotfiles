#!/bin/bash

ROFI_CONFIG_FOLDER="$HOME/.config/rofi/config"
CONFIG_FILE="$ROFI_CONFIG_FOLDER/powermenu.rasi"

help="
  Usage $0 [OPTION]\n
  \n
  OPTIONS:\n
  --poweroff Shutdown system\n
  --reboot Reboot system\n
  --lock Lock session\n
  \n
  --help or -h Open this help section
  "

#Options
yes='  '
no='  '  

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme $CONFIG_FILE
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Execute Command
run() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
    elif [[ $1 == '--lock' ]]; then
      if [[ -x '/usr/bin/betterlockscreen' ]]; then
  			betterlockscreen -l
	  	elif [[ -x '/usr/bin/i3lock' ]]; then
		  	i3lock
      elif [[ -x '/usr/bin/hyprlock' ]]; then
        
        echo "HOLA"
        hyprlock
		  fi
    fi
	else
		exit 0
	fi
}

# Actions
if [[ -z $1 ]];then
  echo -en "Error: Debe ingresar una opción\n$help"
else
  if [[ "$1" == '--shutdown' ]]; then
    run --shutdown
  elif [[ "$1" == '--reboot' ]]; then
    run --reboot
  elif [[ "$1" == '--lock' ]]; then
    echo "HOLA"
    run --lock
  else
    echo "Error: Wrong option $1. \n $help"
    exit 2
  fi
fi
