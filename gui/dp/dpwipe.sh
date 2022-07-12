#!/bin/bash
googspeak "reading chip type" 2>/dev/null &
dpcmd -d > dp/unl/out.out
tail -n3 dp/unl/out.out | head -n1 > dp/unl/out1.out
rm dp/unl/out.out 2>/dev/null
cat dp/unl/out1.out | head -n1 | awk '{print $1;}' > dp/unl/chip.out
rm dp/unl/out1.out 2>/dev/null
if grep -q Error "dp/unl/chip.out"; then
	googspeak "failed to read chip" 2>/dev/null &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat dp/unl/chip.out)
fi
googspeak "confirm to erase chip" 2>/dev/null &
zenity --question --width=300 
case $? in
	0)googspeak "erasing" 2>/dev/null &
	  dpcmd --type $chip -e | zenity --progress --title="Chip erasing..." --text="Erasing "$chip"..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
	googspeak "chip erasure complete" 2>/dev/null &
	zenity --height=100 --width=300 --info --text="$chip Erased"
	;;
	1) kill $$
	;;
	*) $1
	;;
esac


