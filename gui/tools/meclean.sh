#!/bin/bash

yad --height=250 --width=450 --form --title="Clean Intel ME" --text="Choose binfile to clean." --field=File:FL --center > tools/unl/filetome.out
write=$(cat tools/unl/filetome.out | sed 's/|//') 

me_cleaner.py -O tools/unl/melarges.bin -S $write 
me_cleaner.py -O tools/unl/mesmalls.bin -s $write 
 
yad --height=250 --width=350 --title="Clean Intel ME" --text="Files created @ \"./tools/unl/me*.bin.\" melarges.bin is full ME removal (may not boot) mesmalls.bin is ME off." --center
