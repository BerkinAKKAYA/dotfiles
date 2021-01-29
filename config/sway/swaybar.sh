#!/bin/sh

TEMP=$((`cat /sys/class/thermal/thermal_zone0/temp` / 1000))°
#CPU=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%d%\n", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')
#RAM=$(free -h | grep Mem | awk '{ print $3 }')
BAT=$(cat /sys/class/power_supply/BAT0/capacity)%
TIME=$(date "+%d %B, %A | %H:%M")

if [ $(rfkill | grep acer-wireless | awk '{ print $4 }') = "unblocked" ]; then
	wifi="WIFI |"
fi
if [ $(rfkill | grep bluetooth | awk '{ print $4 }') = "unblocked" ]; then
	bt="BT |"
fi

echo $TEMP \| $wifi $bt  $BAT \| $TIME \ 
