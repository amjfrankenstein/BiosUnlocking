#!/bin/bash

dpcmd -d 2>&1 | tee dp/unl/out.out

tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out

rm dp/unl/out.out

cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out

rm dp/unl/out1.out

chip=$(cat dp/unl/chip.out)

zenity --question --width=300
case $? in
	0)dpcmd --type $chip -e | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
	zenity --height=100 --width=300 --info --text="$chip Erased"
	;;
	1) $1
	;;
	*) $1
	;;
esac


