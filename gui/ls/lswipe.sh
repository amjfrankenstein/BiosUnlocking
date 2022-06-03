#!/bin/bash
unset chip 2>/dev/null
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
#flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 -c $chip  -E | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=200 --auto-close --auto-kill --pulsate --time-remaining
flashrom -p dediprog:spispeed=24M -c $chip  -E | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=300 --auto-close --auto-kill --pulsate --time-remaining

