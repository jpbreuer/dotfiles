#!/bin/bash
read messid < ~/.config/i3/messid.txt
if [[ $messid = *[!\ ]* ]]; then
	unread=$(xprop -id $messid | grep -P 'NET_WM_NAME' | cut -d '"' -f2)
else
	xwininfo -name "Messenger for Desktop" 2> /dev/null | grep "Window id:" | grep -Eio "0x[a-z0-9]+" > ~/.config/i3/messid.txt
fi

if [[ $unread = "Messenger for Desktop" ]]; then
	echo " "
else
	echo ${unread:23:1}
fi
