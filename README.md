# Configure Workspace Area for Wacom Devices on Linux

## Description

This script allows selecting a specific area of the screen for a Wacom device to operate only within that area. It provides options to rotate the device's orientation and define the size of the selected area based on its width or height.

## Usage
Assuming you have your device already set up, connected, and also that you are using X11, install slop with the following command:
Debian:
```bash
sudo apt install slop
```
Arch:
```bash
sudo pacman -S slop
```

Then clone the repository and run the script with the following command:
```bash
git clone https://github.com/kelvinauta/set_wacom_area && cd set_wacom_area
```

Execute the script with the following command:
```bash
./set_wacom_area.sh
```


## Requirements

To use this script, the following tools and environments are needed:
- **Wacom Device**: Must be installed and configured on a Linux system. For more details on setting up Wacom on Linux, refer to the official guide: [Linux Wacom Project](https://linuxwacom.github.io/).
- **slop**: A tool for selecting screen areas.
- **X11**: X Window System for graphical environments on Unix.

## Explanation of Variables

The script uses three input variables:

1. `rotate`: Defines the rotation of the Wacom device. Possible values are:
   - `normal` (default): No rotation.
   - `left`: Rotation to the left (90 degrees counterclockwise).
   - `right`: Rotation to the right (90 degrees clockwise).
   - `inverted`: 180-degree rotation.

2. `size_master`: Defines the master dimension to calculate the workspace area based on the aspect ratio. Possible values are:
   - `weight` (default): Uses the selected width to calculate the height.
   - `height`: Uses the selected height to calculate the width.

3. `wacom_id`: The ID of the Wacom device. If empty, the script will list available Wacom devices and prompt the user to select one.

## Aspect Ratio

The script uses a default aspect ratio of 3:2, which is common for Wacom devices. This aspect ratio can be modified directly in the script according to the user's needs.

## Usage Examples

1. `./set_wacom_area.sh normal weight`: Sets up the workspace area with no rotation and uses the selected width to calculate the height.

2. `./set_wacom_area.sh left height`: Rotates the device 90 degrees to the left and uses the selected height to calculate the width.

3. `./set_wacom_area.sh right height`: Rotates the device 90 degrees to the right and uses the selected height to calculate the width.

4. `./set_wacom_area.sh inverted weight`: Rotates the device 180 degrees and uses the selected width to calculate the height.
