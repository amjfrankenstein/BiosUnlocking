#!/bin/bash

dpcmd -d 2>&1 | tee dp/unl/out.out

tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out

rm dp/unl/out.out

cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out

rm dp/unl/out1.out

if grep -q Error "dp/unl/chip.out"; then
    zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat dp/unl/chip.out)
fi

filename=$(yad --entry --width=300 --center)

if [ -z "$filename" ]
then
	zenity --height=100 --width=300 --error --text="Nothing Selected"
    kill $$
else
    dpcmd --type $chip -r 'dp/unl/'$filename | zenity --progress --title="Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
fi

zenity --height=100 --width=300 --info --text=$filename' Saved.'
