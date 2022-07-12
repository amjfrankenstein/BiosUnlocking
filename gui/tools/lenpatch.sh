#! /bin/bash
googspeak "select bin file to patch" 2>/dev/null &
lenfile=$(zenity --file-selection)
googspeak "patching bin file for unlock" 2>/dev/null &
autopatcher/autopatch $lenfile | zenity --progress --title="Unlocking bin..." --text="Patching bin..." --width=300 --auto-close --auto-kill --pulsate --time-remaining --percentage=100

s=$lenfile
lennewfile=$(echo "${s%????}_PATCHED${s: -4}")
mv $lennewfile saved/
googspeak "file saved" 2>/dev/null &
zenity --height=200 --width=350 --info --text="File Saved to ~/BiosUnlocking/gui/saved/"
