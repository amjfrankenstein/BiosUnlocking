#!/bin/bash
unset chip 2>/dev/null
./ls/getchip.sh
./ls/editchip1.sh
./ls/editchip2.sh
chip=$(cat ls/unl/chip2.out)
zenity --height=200 --width=350 --title="Chip Type is:" --info --text=$chip 
rm ls/unl/*.out 2>/dev/null
#kill $$
