#!/bin/bash
new_bright=$(($(cat /sys/class/backlight/intel_backlight/brightness) +10))
if [ $new_bright -gt $(($(cat /sys/class/backlight/intel_backlight/max_brightness))) ] 
then
	new_bright=1500
fi

sudo tee /sys/class/backlight/intel_backlight/brightness <<< $new_bright
