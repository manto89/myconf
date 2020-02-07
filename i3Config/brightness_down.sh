#!/bin/bash
new_bright=$(($(cat /sys/class/backlight/intel_backlight/brightness) -10))
if [ $(($new_bright)) -lt 1 ] 
then
	new_bright=1
fi

sudo tee /sys/class/backlight/intel_backlight/brightness <<< $new_bright
