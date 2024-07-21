#!/bin/bash

# Variables por defecto
rotate="${1:-normal}"
slop_script="~/src/scripts/set_wacom/slop.sh"
wacom_id=17

case "$rotate" in
    normal)
        read -r X Y W H < <("$slop_script" "weight")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate none
        ;;
    left)
        read -r X Y W H < <("$slop_script" "height")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate ccw
        ;;
    right)
        read -r X Y W H < <("$slop_script" "height")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate cw
        ;;
    inverted)
        read -r X Y W H < <("$slop_script" "weight")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate half
        ;;
    left-weight)
        read -r X Y W H < <("$slop_script" "weight")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate ccw
        ;;
    right-weight)
        read -r X Y W H < <("$slop_script" "weight")
        geometry="${W}x${H}+${X}+${Y}"
        xsetwacom set $wacom_id rotate cw
        ;;
    *)
        echo "Opción de rotación no válida: $rotate"
        exit 1
        ;;
esac

echo "$geometry"
xsetwacom set $wacom_id MapToOutput "$geometry"
