import subprocess
import os
from guizero import *

def do_nothing():
    print("Button was pressed")

def dpscan():
    process = subprocess.Popen("dp/dpscan.sh")

def dpsingleread():
    process = subprocess.Popen("dp/dpsingleread.sh")

def dpfullread():
    process = subprocess.Popen("dp/dpfullread.sh")

def dpwipe():
    process = subprocess.Popen("dp/dpwipe.sh")

def dpwrite():
    process = subprocess.Popen("dp/dpwrite.sh")

def spiscan():
    process = subprocess.Popen("ls/lsscan.sh")

def spisingleread():
    process = subprocess.Popen("ls/lssingleread.sh")

def spifullread():
    process = subprocess.Popen("ls/lsfullread.sh")

def spiwipe():
    process = subprocess.Popen("ls/lswipe.sh")

def spiwrite():
    process = subprocess.Popen("ls/lswrite.sh")

def dplenfullunlock():
    process = subprocess.Popen("fu/lenovodediprog.sh")

def spilenfullunlock():
    process = subprocess.Popen("fu/lenovospi.sh")

def dphpfullunlock():
    process = subprocess.Popen("fu/hpdediprog.sh")

def spihpfullunlock():
    process = subprocess.Popen("fu/hpspi.sh")

def clearfiles():
    process = subprocess.Popen("./clearfiles.sh")

def dellsite():
    process = subprocess.Popen("media/dellsite.sh")

def meclean():
    process = subprocess.Popen("tools/meclean.sh")




app = App(bg="grey", title="Alta E-Solutions BIOS HAX", height=600, width=900, layout="grid")

picture1 = Picture(app, grid=[0,0,2,3], image="media/alogo.png")

box1 = Box(app, width=300, height=300, grid=[0,0])
box4 = Box(app, width=300, height=300, grid=[0,1])
#box7 = Box(app, width=300, height=300, grid=[0,2])
box2 = Box(app, width=300, height=300, grid=[1,0])
box5 = Box(app, width=300, height=300, grid=[1,1])
#box8 = Box(app, width=300, height=300, grid=[1,2])
box3 = Box(app, width=300, height=300, grid=[2,0])
box6 = Box(app, width=300, height=300, grid=[2,1])
#box9 = Box(app, width=300, height=300, grid=[2,2])

box1.bg = "#f5fff8"
box2.bg = "#bbc4bd"
box3.bg = "#f5fff8"
box4.bg = "#bbc4bd"
box5.bg = "#f5fff8"
box6.bg = "#bbc4bd"
#box7.bg = "#b3b3b3"
#box8.bg = "#8a8a8a"
#box9.bg = "#b3b3b3"

text1 = Text(box1, size=24, color="#003800", text="Dediprog Menu")
text2 = Text(box2, size=24, color="#003800",text="Linux SPI Menu")
text3 = Text(box3, size=24, color="#003800", text="Lenovo Full Unlock")
text4 = Text(box4, color="#003800")
text6 = Text(box6, color="#003800")
#text7 = Text(box7, text="Box 7")
##text8 = Text(box8, text="Box 8")
#text9 = Text(box9, text="Box 9")

##BOX1:::::::::::::::::::::::::::::::::::::::::::::::::::::
button1_1 = PushButton(box1, width=20, text="SF100 Scan Chip", command=dpscan)
button1_2 = PushButton(box1, width=20, text="SF100 Single Read", command=dpsingleread)
button1_3 = PushButton(box1, width=20, text="SF100 Full Read", command=dpfullread)
button1_4 = PushButton(box1, width=20, text="SF100 Erase Chip", command=dpwipe)
button1_5 = PushButton(box1, width=20, text="SF100 Write Chip", command=dpwrite)
button1_1.bg = "#b7c4b7"
button1_2.bg = "#ddeddd"
button1_3.bg = "#b7c4b7"
button1_4.bg = "#ddeddd"
button1_5.bg = "#b7c4b7"
##BOX2:::::::::::::::::::::::::::::::::::::::::::::::::::::
button2_1 = PushButton(box2, width=20, text="SPI:0 Scan Chip", command=spiscan)
button2_2 = PushButton(box2, width=20, text="SPI:0 Single Read", command=spisingleread)
button2_3 = PushButton(box2, width=20, text="SPI:0 Full Read", command=spifullread)
button2_4 = PushButton(box2, width=20, text="SPI:0 Erase Chip", command=spiwipe)
button2_5 = PushButton(box2, width=20, text="SPI:0 Write Chip", command=spiwrite)
button2_1.bg = "#b7c4b7"
button2_2.bg = "#ddeddd"
button2_3.bg = "#b7c4b7"
button2_4.bg = "#ddeddd"
button2_5.bg = "#b7c4b7"
##BOX3:::::::::::::::::::::::::::::::::::::::::::::::::::::
button3_1 = PushButton(box3, width=20, text="SF100  IBM Full Unlock", command=dplenfullunlock)
button3_2 = PushButton(box3, width=20, text="SPI:0 IBM Full Unlock", command=spilenfullunlock)
text5 = Text(box3, size=24, color="#003800", text="HP Full Unlock")
button3_3 = PushButton(box3, width=20, text="SF100 HP Full Unlock", command=dphpfullunlock)
button3_4 = PushButton(box3, width=20, text="SPI:0 HP Full Unlock", command=spihpfullunlock)
#button3_3 = PushButton(box3, width=20, text="", command=do_nothing)
#button3_4 = PushButton(box3, width=20, text="", command=do_nothing)
#button3_5 = PushButton(box3, width=20, text="", command=do_nothing)
button3_1.bg = "#b7c4b7"
button3_2.bg = "#ddeddd"
button3_3.bg = "#b7c4b7"
button3_4.bg = "#ddeddd"
#button3_5.bg = "#b7c4b7"

picture1 = Picture(box4, image="media/alogo.png")

##BOX4:::::::::::::::::::::::::::::::::::::::::::::::::::::

text5= Text(box5, size=35)

button5_1 = PushButton(box5, width=20, text="Clear Files/Reset", command=clearfiles)
button5_2 = PushButton(box5, width=20, text="Open Dell Unlock Site", command=dellsite)
#button5_5 = PushButton(box5, width=20, text="", command=do_nothing)
button5_1.bg = "#ffadad"
button5_2.bg = "#ddeddd"
#button5_3.bg = "#ffadad"
#button5_4.bg = "#ddeddd"
#button5_5.bg = "#b7c4b7"

picture2 = Picture(box6, image="media/alogo.png")

app.display()
