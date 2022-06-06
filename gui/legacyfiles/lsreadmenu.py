import subprocess
import os
from guizero import *
def lsfullread():
    process = subprocess.Popen(
        "gnome-terminal -- ls/lsfullread.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def lssingleread():
    process = subprocess.Popen(
        "gnome-terminal -- ls/lssingleread.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def lscompare():
    process = subprocess.Popen(
        "gnome-terminal -- ls/lscompare.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#babdff", title="LinuxSPI Read")
button1 = PushButton(app, width="15", command=lsfullread, text="Full Read Chip")
button2 = PushButton(app, width="15", command=lssingleread, text="Read Chip Once")
button3 = PushButton(app, width="15", command=lscompare, text="Compare 2 .bin")
button4 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "#4ab33d"
button4.bg = "red"
app.icon = "media/altaicon2.gif"
app.display()

