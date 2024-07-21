#!/bin/bash

# Define la proporción deseada, por ejemplo, 16:9
ASPECT_W=3
ASPECT_H=2

# Obtiene la variable master_side (por defecto es weight)
MASTER_SIDE="${1:-weight}"

# Obtiene la selección del usuario con slop
read -r X Y W H < <(slop -f "%x %y %w %h")

if [ "$MASTER_SIDE" == "height" ]; then
	ASPECT_WIDTH=ASPECT_H
	ASPECT_HEIGHT=ASPECT_W
    # Calcula el ancho objetivo basado en el alto seleccionado
    TARGET_WIDTH=$((H * ASPECT_WIDTH / ASPECT_HEIGHT))

    echo "$X $Y $TARGET_WIDTH $H"
else
	ASPECT_WIDTH=ASPECT_W
	ASPECT_HEIGHT=ASPECT_H
    # Calcula el alto objetivo basado en el ancho seleccionado
    TARGET_HEIGHT=$((W * ASPECT_HEIGHT / ASPECT_WIDTH))
    echo "$X $Y $W $TARGET_HEIGHT"
fi
