# Configurar Área de Trabajo para Dispositivos Wacom en Linux

## Descripción

Este script permite seleccionar un área específica de la pantalla para que un dispositivo Wacom funcione solo en esa área. Proporciona opciones para rotar la orientación del dispositivo y definir el tamaño del área seleccionada en función de su ancho o alto.

## Uso
Asumiendo que tiene su dispositivo ya configurado, conectado y además que usa X11, instale slop con el siguiente comando:
Debian:
```bash
sudo apt install slop
```
Arch:
```bash
sudo pacman -S slop
```

Luego clone el repositorio y ejecute el script con el siguiente comando:
```bash
git clone https://github.com/kelvinauta/set_wacom_area && cd set_wacom_area
```

Ejecute el script con el siguiente comando:
```bash
./set_wacom_area.sh
```


## Requisitos

Para utilizar este script, se necesitan las siguientes herramientas y entornos:
- **Dispositivo Wacom**: Debe estar instalado y configurado en un sistema Linux. Para más detalles sobre la configuración de Wacom en Linux, consulte la guía oficial: [Linux Wacom Project](https://linuxwacom.github.io/).
- **slop**: Una herramienta para seleccionar áreas de la pantalla.
- **X11**: Sistema de ventanas X para entornos gráficos en Unix.

## Explicación de las Variables

El script utiliza tres variables de entrada:

1. `rotate`: Define la rotación del dispositivo Wacom. Los valores posibles son:
   - `normal` (por defecto): Sin rotación.
   - `left`: Rotación hacia la izquierda (90 grados en sentido antihorario).
   - `right`: Rotación hacia la derecha (90 grados en sentido horario).
   - `inverted`: Rotación de 180 grados.

2. `size_master`: Define la dimensión maestra para calcular el área de trabajo en función de la relación de aspecto. Los valores posibles son:
   - `weight` (por defecto): Utiliza el ancho seleccionado para calcular la altura.
   - `height`: Utiliza la altura seleccionada para calcular el ancho.

3. `wacom_id`: El ID del dispositivo Wacom. Si está vacío, el script listará los dispositivos Wacom disponibles y solicitará al usuario que seleccione uno.

## Aspect Ratio

El script utiliza una relación de aspecto predeterminada de 3:2, que es común para dispositivos Wacom. Esta relación de aspecto se puede modificar directamente en el script según las necesidades del usuario.

## Ejemplos de Uso

1. `./set_wacom_area.sh normal weight`: Configura el área de trabajo sin rotación y utiliza el ancho seleccionado para calcular la altura.

2. `./set_wacom_area.sh left height`: Rota el dispositivo 90 grados hacia la izquierda y utiliza la altura seleccionada para calcular el ancho.

3. `./set_wacom_area.sh right height`: Rota el dispositivo 90 grados hacia la derecha y utiliza la altura seleccionada para calcular el ancho.

4. `./set_wacom_area.sh inverted weight`: Rota el dispositivo 180 grados y utiliza el ancho seleccionado para calcular la altura.
