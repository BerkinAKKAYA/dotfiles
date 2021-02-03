#!/bin/sh

RF_WIFI=$(rfkill | grep acer-wireless | awk '{ print $4 }')
RF_BT=$(rfkill | grep bluetooth | awk '{ print $4 }')

BAT=$(cat /sys/class/power_supply/BAT0/capacity)%
DATE=$(date "+%d %B, %A | %H:%M")

[ $RF_WIFI = "unblocked" ] && echo -n "WIFI | "
[ $RF_BT   = "unblocked" ] && echo -n "BT | "

echo -n " $BAT | $DATE  "
