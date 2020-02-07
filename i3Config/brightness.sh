#!/bin/bash
new_bright=$(($(cat /sys/class/backlight/intel_backlight/brightness)))
max_bright=$(($(cat /sys/class/backlight/intel_backlight/max_brightness)))
echo $(( 100 - ( ($max_bright - $new_bright ) * 100 / $max_bright)))
