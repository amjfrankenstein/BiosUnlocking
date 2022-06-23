#!/bin/bash
yad --height=250 --width=450 --form --title="Clean Intel ME" --text="Choose binfile to clean." --field=File:FL --center > tools/unl/filetome.out
case $? in
	0)write=$(cat tools/unl/filetome.out | sed 's/|//') 
	  me_cleaner -O saved/melarges.bin -S $write 
	  me_cleaner -O saved/mesmalls.bin -s $write 
 	  yad --height=250 --width=375 --title="Clean Intel ME" --text="`printf "<big>Files created @</big> \n<small><small>$HOME/BiosUnlocking/gui/saved/me*.bin</small></small> \n \nmelarges.bin is ME removal \n<big>(may not boot)</big> \n \nmesmalls.bin is ME bit off."`" --center
	;;
	1) $1
	;;
	*) $1
	;;
esac

