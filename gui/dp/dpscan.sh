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
	zenity --height=100 --width=300 --title="Chip Type is:" --info --text="<big><big>$chip</big></big>"
fi

