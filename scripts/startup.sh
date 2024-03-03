#!/bin/bash

mousesens=0.6

if [[ "$HOSTNAME" == *"PC"* ]]; then
	xinput set-prop "Logitech G502 HERO SE" 163 $mousesens, 0.00000, 0.00000, 0.000000, $mousesens, 0.000000, 0.000000, 0.000000, 1.000000
	xrandr --rate 144
fi

if [ $HOSTNAME = danielsLaptop ]; then
	xinput set-prop "MSFT0001:00 04F3:3082 Touchpad" "libinput Natural Scrolling Enabled" 1
	xinput set-prop "MSFT0001:00 04F3:3082 Touchpad" 333 0
	xinput set-prop "MSFT0001:00 04F3:3082 Touchpad" 322 10
fi
