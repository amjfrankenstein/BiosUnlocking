import subprocess
import os
from guizero import App, PushButton
def e6440comp1():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe1.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp2():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe2.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp3():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe3.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp4():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe4.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp5():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe5.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp6():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe22.sh",
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp7():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe33.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp8():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe44.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def e6440comp9():
    process = subprocess.Popen(
        "gnome-terminal -x ~/BiosUnlocking/gui/dp/exe55.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
app = App(title="Dell E6440 Computrace Removal")
button1 = PushButton(app, command=e6440comp1, text="Scan Chip")
button2 = PushButton(app, command=e6440comp2, text="W25Q32 Wipe 4MB")
button3 = PushButton(app, command=e6440comp3, text="W25Q32 Write 4MB")
button4 = PushButton(app, command=e6440comp4, text="W25Q64BV Wipe 8MB")
button5 = PushButton(app, command=e6440comp5, text="W25Q64BV Write 8MB")
button6 = PushButton(app, command=e6440comp6, text="EN25QH32 Wipe 4MB")
button7 = PushButton(app, command=e6440comp7, text="EN25QH32 Write 4MB")
button8 = PushButton(app, command=e6440comp8, text="EN25QH64 Wipe 8MB")
button9 = PushButton(app, command=e6440comp9, text="EN25QH64 Write 8MB")
button1.bg = "white"
button2.bg = "red"
button3.bg = "green"
button4.bg = "red"
button5.bg = "green"
button6.bg = "red"
button7.bg = "green"
button8.bg = "red"
button9.bg = "green"

app.display()

