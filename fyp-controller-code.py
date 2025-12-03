from picozero import Pot, pico_led, Button, LED

from time import sleep

pico_led.on()

dial = Pot(26)
butt = Button(15)

phone_led = LED(0)
net_led = LED(2)
disconnect_led = LED(7)

status = "status : negative"


#this function is used to determine the action choice based on the knob value
def knob_pick():
    
    phone_led.off()
    net_led.off()
    disconnect_led.off()
    
    if dial.value < 0.3:
        knobStatus = "PHONE HELP"
        phone_led.on()
        #turn on leftmost led
    elif dial.value > 0.3 and dial.value < 0.6:
        knobStatus = "NET HELP"
        net_led.on()
        #turn on middle led
    else:
        knobStatus = "DISCONNECT"
        #disconnect_led.on()
        #turn on rightmost led
    return knobStatus

while True:
    #print(dial.value)
    
    status = knob_pick()
        
    if butt.is_pressed:
        print(status)
    
    sleep(0.1)

