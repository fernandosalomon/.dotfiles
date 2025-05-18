#!/bin/bash

SCREENSHOT_DIR="$HOME/Imágenes/screenshot"

if [ ! -d $SCREENSHOT_DIR ]; then
  mkdir $SCREENSHOT_DIR
  echo "Directorio $SCREENSHOT_DIR creado"
fi

grim -g "$(slurp)" $SCREENSHOT_DIR/$(date +'%s_grim.png')



