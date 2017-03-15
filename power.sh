#!/bin/sh

res=$(rofi -p "> " -dmenu < ~/.config/i3/powermenu)

if [ $res = "logout" ]; then
	i3-msg exit
fi
if [ $res = "restart" ]; then
	systemctl reboot
fi
if [ $res = "shutdown" ]; then
	systemctl poweroff -i
fi
if [ $res = "suspend" ]; then
	systemctl suspend && i3lock-fancy
fi
if [ $res = "lock" ]; then
	i3lock-fancy
fi
exit 0
