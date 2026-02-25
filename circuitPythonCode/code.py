#import board support libraries, including HID.
import board
import digitalio
import analogio
import usb_hid

#Libraries for the OLED Display
from adafruit_display_text import label
import adafruit_displayio_ssd1306
import terminalio
import displayio
import busio

from time import sleep

#Libraries for communicating as a Keyboard device
from adafruit_hid.keyboard import Keyboard
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS
from adafruit_hid.keycode import Keycode

#library for communicating as a gamepad
from hid_gamepad import Gamepad

gp = Gamepad(usb_hid.devices)

#jackPin = Pin(0, Pin.IN, Pin.PULL_DOWN)
jackPin = digitalio.DigitalInOut(board.GP0)
jackPin.direction = digitalio.Direction.INPUT
jackPin.pull = digitalio.Pull.DOWN

pot = analogio.AnalogIn(board.A0)

# Equivalent of Arduino's map() function.
def range_map(x, in_min, in_max, out_min, out_max):
    return (x - in_min) * (out_max - out_min) // (in_max - in_min) + out_min

while True:
    #jack = Button(0)
    #rint(jackPin.value())
    #print(jack.value)
    #print(jack.is_active)

    if not jackPin.value:
        print("Cable connected")
        gp.press_buttons(1)
    else:
        print("Cable not connected")
        gp.release_buttons(1)
        
    
    joyValue = int(pot.value / 65000)*127
    print(joyValue)
    #gp.move_joysticks(x= joyValue)
    gp.move_joysticks(range_map(pot.value, 0, 65535, -127, 127))
    sleep(0.1)
