from machine import Pin
import time

jack = Pin(0, Pin.IN, Pin.PULL_DOWN)

while True:
    if jack.value() == 0:
        print("Button is Pressed")
    else:
        print("Button is not Pressed")
    time.sleep(0.1)