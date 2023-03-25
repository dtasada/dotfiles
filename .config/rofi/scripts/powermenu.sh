#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/rofi/themes/" uptime=$(uptime -p | sed -e 's/up //g')

theme="$1"
rofi_command="rofi -no-config -theme ~/.config/rofi/themes/$theme"

# Options
shutdown="⏻ Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"
# Confirmation
confirm_exit() {
	rofi -dmenu\
        #-no-config\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		#-theme $dir/confirm.rasi
}

# Message
#msg() {
#	rofi -no-config -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
#}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
      exec swaylock
        ;;
    $suspend)
		mpc -q pause
		amixer set Master mute
		systemctl suspend
        ;;
    $logout)
    killall bspwm
        ;;
esac
