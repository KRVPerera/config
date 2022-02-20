#!/bin/bash
maxBrightness=`cat /sys/class/backlight/amdgpu_bl0/max_brightness | bc`
currentBrightness=`cat /sys/class/backlight/amdgpu_bl0/brightness | bc`
echo "Current Brighteness is : $currentBrightness"
echo "Max Brightness is : $maxBrightness"

if [[ -z $1 ]]; then
    echo "Not set: please provide brightness value"
    exit 0
fi

inputValue=`echo $1 | bc`

if (( $inputValue > $maxBrightness )); then
    echo "Invalid max brightness is $maxBrightness"
    exit 0
fi

echo "Brighteness set to : "
echo $1 | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
