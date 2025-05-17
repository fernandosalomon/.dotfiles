#!/bin/bash

help="
Uso:\n
  $0 [OPCION]\n\n

OPCIONES:\n\n
  --toggle-volume: mute/unmute default sink.\n
  --inc: Increase volume of default sink by 5%.\n
  --dec: Decrease volume of default sink by 5%.\n
  --mic-inc: Increase volume of default source by 5%.\n
  --mic-dec: Decrease volume of default source by 5%.\n
  --toggle-mic: mute/unmute default source.\n\n
  Opciones de ayuda:\n
  -h, --help  Mostrar opciones de ayuda
"

MAX_INPUT_VOLUME=0.95
MAX_OUTPUT_VOLUME=1.15

inc_volume(){

  local volume=$(wpctl get-volume @DEFAULT_SINK@ | cut -d: -f2)
  local is_volume_max=$(echo "$volume <= $MAX_OUTPUT_VOLUME" | bc)
  
  if [[ $is_volume_max == 1 ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%+
  fi

}

dec_volume(){
  wpctl set-volume @DEFAULT_SINK@ 5%-
}

toggle_volume(){
  wpctl set-mute @DEFAULT_SINK@ toggle
}

inc_mic_volume(){

  local volume=$(wpctl get-volume @DEFAULT_SOURCE@ | cut -d: -f2)
  local is_volume_max=$(echo "$volume <= $MAX_INPUT_VOLUME" | bc)
 
  if [[ $is_volume_max == 1 ]];then
    wpctl set-volume @DEFAULT_SOURCE@ 5%+
  fi
}

dec_mic_volume(){
  wpctl set-volume @DEFAULT_SOURCE@ 5%-
}

toggle_mic_volume(){
  wpctl set-mute @DEFAULT_SOURCE@ toggle
}

if [[ $1 == "--toggle" ]]; then
  toggle_volume
elif [[ $1 == "--inc" ]]; then
  inc_volume
elif [[ $1 == "--dec" ]]; then
  dec_volume
elif [[ $1 == "--mic-inc" ]]; then
  inc_mic_volume
elif [[ $1 == "--mic-dec" ]]; then
  dec_mic_volume
elif [[ $1 == "--toggle-mic" ]]; then
  toggle_mic_volume
elif [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
  echo -en $help
else
  echo -en "Error: Opción desconocida $1\n$help"
fi
