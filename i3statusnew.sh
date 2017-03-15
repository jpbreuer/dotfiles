#!/bin/bash

i3status | while :
do
	read line
	music="(~/.scripts/nowplaying.sh)"
#	ram="awk '/MemTotal/ {memtotal=$2}; /MemAvailable/ {memavail=$2}; END { 
printf("RAM: %.0f", (100- (memavail / memtotal * 100))) }' /proc/meminfo"
	echo "${music} | $line" || exit 1
done
