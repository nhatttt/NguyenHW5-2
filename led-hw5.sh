#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.
# for this homework, the script accepts two new command line arguments
# called blink and an integer new
# the script blinks USR3 LED n times (a blink is On followed by Off)
# at 1 second intervals

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
elif [ "$1" == "blink" ]; then
	echo "blinking the LED $2 times"
	
	for ((i=0; i<$2; i++))
	do
		echo "1" >> "$LED3_PATH/brightness"
		T1=$(date +%S%N)
		T2=$(date +%S%N)
		T3=$((T2-T1))
		while [ $T3 -lt 1000000000 ]
		do
			T2=$(date +%S%N)
			T3=$((T2-T1))

		done
		
		echo "0" >> "$LED3_PATH/brightness"
		T1=$(date +%S%N)
		T2=$(date +%S%N)
		T3=$((T2-T1))
		while [ $T3 -lt 1000000000 ]
		do
			T2=$(date +%S%N)
			T3=$((T2-T1))

		done		
	
	done

fi

echo "End of the LED Bash Script"
