#!/bin/bash
yad --height=250 --width=450 --form --title="Choose File" --field=File:FL --center > tools/unl/filetome.out
write=$(cat tools/unl/filetome.out | sed 's/|//') 
python tools/me_cleaner.py -O tools/unl/meSS.bin -S $write 
python tools/me_cleaner.py -O tools/unl/mess.bin -s $write 
dpcmd -d 2>&1 | tee tools/unl/out.out
tail -n3 tools/unl/out.out | head -n1 > tools/unl/out1.out
rm tools/unl/out.out
cat tools/unl/out1.out | head -n1 | awk '{print $1;}' > tools/unl/chip.out
rm tools/unl/out1.out
if grep -q Error "tools/unl/chip.out"; then
    zenity --height=200 --width=350 --timeout=3 --error --text="Failed to read chip"
    kill $$
else
    chip=$(cat tools/unl/chip.out)
fi
yad --text --title="Alta Unlocks" --text='Which file to Upload?' --button="FullME:0" --button="MiniME:1" --text-align=center --width=450 --height=150 --center --buttons-layout=center
case $? in
	0)dpcmd --type $chip -u tools/unl/meSS.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	;;
	1)dpcmd --type $chip -u tools/unl/mess.bin | zenity --progress --title="Flashing Chip..." --text="Writing to chip..." --width=200 --auto-close --auto-kill --pulsate --time-remaining --percentage=100
	;;
	*) $1
	;;
esac
zenity --height=200 --width=350 --info --text="Write Complete" 
