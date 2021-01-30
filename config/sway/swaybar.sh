#!/bin/sh

TEMP=$((`cat /sys/class/thermal/thermal_zone0/temp` / 1000))°
BAT=$(cat /sys/class/power_supply/BAT0/capacity)%
TIME=$(date "+%d %B, %A | %H:%M")

if [ $(rfkill | grep acer-wireless | awk '{ print $4 }') = "unblocked" ]; then
	wifi="WIFI |"
fi
if [ $(rfkill | grep bluetooth | awk '{ print $4 }') = "unblocked" ]; then
	bt="BT |"
fi

echo $TEMP \| $wifi $bt  $BAT \| $TIME \ 
