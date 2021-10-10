#!/bin/bash
# the following script invokes application led-hw5.sh contained within the same folder
# The first invocation will turn the LED on.
# The second invocation will turn the LED off.
# The third invocation will read status.
# The fourth invocation will flash the LED.
# The fifth invocation will blink the LED 3 times.
# the script invokes the flash functionality which needs to be run in sudo
# example: sudo ./commanderBash.sh

echo "Turning LED on"
./led-hw5.sh on

echo "Turning LED off"
./led-hw5.sh off

echo "Reading LED status"
./led-hw5.sh status

echo "Flashing LED"
./led-hw5.sh flash

echo "Turning LED off before blinking"
./led-hw5.sh off

echo "Blinking LED "
./led-hw5.sh blink 3
