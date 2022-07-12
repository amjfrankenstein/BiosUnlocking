#!/bin/bash
googspeak "reading chip type" 2>/dev/null &
dpcmd -d > fu/unl/out.out
tail -n3 fu/unl/out.out | head -n1 > fu/unl/out1.out
rm fu/unl/out.out 2>/dev/null
cat fu/unl/out1.out | head -n1 | awk '{print $1;}' > fu/unl/chip.out
rm fu/unl/out1.out 2>/dev/null
if grep -q Error "fu/unl/chip.out"; then
	googspeak "failed to read chip" 2>/dev/null &    
	zenity --height=100 --width=300 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat fu/unl/chip.out)
fi
googspeak "reading chip first pass" 2>/dev/null &
dpcmd --type $chip -r fu/unl/fullread1.bin | zenity --progress --title="First Reading..." --text="Reading chip..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
googspeak "reading chip second pass" 2>/dev/null &
dpcmd --type $chip -r fu/unl/fullread2.bin| zenity --progress --title="Second Reading..." --text="Reading chip again..." --width=300 --auto-close --auto-kill --pulsate --time-remaining
zenity --height=100 --width=300 --timeout=2 --info --text="comparing files" &
googspeak "comparing files" 2>/dev/null 
difference=$(diff fu/unl/fullread1.bin fu/unl/fullread2.bin)
if [ -z "$difference" ]
then
	googspeak "bin files match, successful read" 2>/dev/null &    
	zenity --height=100 --width=300 --timeout=2 --info --text="Files Match."
else
	googspeak "bin files do not match" 2>/dev/null &
    zenity --height=100 --width=300 --warning --text="Files do not Match."
fi
