#!/bin/bash

# Variables por defecto
rotate="${1:-normal}"
size_master="${2:-weight}"
wacom_id="$3"

# Define la proporción deseada, por ejemplo, 16:9
ASPECT_W=3
ASPECT_H=2

slop_area(){
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
}
# Función para listar dispositivos Wacom y seleccionar uno
select_wacom_device() {
    devices=$(xsetwacom --list devices)
    if [ -z "$devices" ]; then
        echo "No se encontraron dispositivos Wacom."
        exit 1
    fi

    echo "Seleccione un dispositivo Wacom:"
    IFS=$'\n' read -r -d '' -a device_array <<< "$devices"
    for i in "${!device_array[@]}"; do
        echo "$i) ${device_array[$i]}"
    done

    read -p "Ingrese el número del dispositivo Wacom: " device_number
    if [[ ! "$device_number" =~ ^[0-9]+$ ]] || [ "$device_number" -ge "${#device_array[@]}" ]; then
        echo "Selección inválida."
        exit 1
    fi

    wacom_id=$(echo "${device_array[$device_number]}" | grep -oP 'id: \K\d+')
}

# Si wacom_id está vacío, solicitar selección
if [ -z "$wacom_id" ]; then
    select_wacom_device
fi

# Rotación y tamaño del área
case "$rotate" in
    normal)
        read -r X Y W H < <(slop_area "$size_master")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate none
        ;;
    left)
        read -r X Y W H < <(slop_area "$size_master")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate ccw
        ;;
    right)
        read -r X Y W H < <(slop_area "$size_master")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate cw
        ;;
    inverted)
        read -r X Y W H < <(slop_area "$size_master")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate half
        ;;
    *)
        echo "Opción de rotación no válida: $rotate"
        exit 1
        ;;
esac

echo "$geometry"
xsetwacom set $wacom_id MapToOutput "$geometry"
