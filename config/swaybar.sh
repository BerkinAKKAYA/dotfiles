#!/bin/sh

BAT=$(cat /sys/class/power_supply/BAT0/capacity)%
DATE=$(date "+%d %B, %A | %H:%M")

echo " $BAT | $DATE  "
