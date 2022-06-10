import subprocess
import os
from guizero import *
def dpfullread():
    process = subprocess.Popen(
        "gnome-terminal -- dp/dpfullread.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def dpsingleread():
    process = subprocess.Popen(
        "gnome-terminal -- dp/dpsingleread.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def dpcompare():
    process = subprocess.Popen(
        "gnome-terminal -- dp/dpcompare.sh", 
        stdout=subprocess.PIPE,
        stderr=None,
        shell=True
    )
def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#9ac495", title="Dediprog Read")
button1 = PushButton(app, width="15", command=dpfullread, text="Full Read Chip")
button2 = PushButton(app, width="15", command=dpsingleread, text="Read Chip Once")
button3 = PushButton(app, width="15", command=dpcompare, text="Compare 2 .bin")
button4 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "#4ab33d"
button4.bg = "red"
app.icon = "media/altaicon2.gif"
app.display()

