from machine import Pin
from picozero import Button, Pot
from time import sleep

#jack = Pin(4, Pin.OUT)
jack = Button(0)
jackPin = Pin(0, Pin.OUT, Pin.PULL_DOWN)


while True:
    #jack = Button(0)
    #rint(jackPin.value())
    #print(jack.value)
    #print(jack.is_active)

    if jackPin.value() == 0:
        print("Button is pressed")
    else:
        print("Button is not pressed")
    #sleep(1)