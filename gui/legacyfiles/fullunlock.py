import subprocess
import os
from guizero import App, PushButton

def fulenovo():
    process = subprocess.Popen("fu/lenovoproject.sh")

def fuhp():
    process = subprocess.Popen("fu/hpproject.sh")

def close_window():
    app.destroy()

app = App(width=400, height=300, bg="#fffccc", title="Full Unlocks")
button1 = PushButton(app, width="15", command=fulenovo, text="Lenovo Project")
button2 = PushButton(app, width="15", command=fuhp, text="HP Project")
button3 = PushButton(app, width="15", command=close_window, text="Close")
button1.bg = "#4ab33d"
button2.bg = "white"
button3.bg = "red"
app.icon = "media/altaicon2.gif"

app.display()

