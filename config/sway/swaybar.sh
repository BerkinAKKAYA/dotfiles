#!/bin/sh

cpu_temp=$((`cat /sys/class/thermal/thermal_zone0/temp` / 1000))°
cpu_usage=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%d%\n", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')
meminfo=$(free -h | grep Mem | awk '{ print $3 }')
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)%
brightness=$((`cat /sys/class/backlight/intel_backlight/brightness` / 1000))%
volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%
date_and_time=$(date "+%d %B, %A | %H:%M")

if [ $(rfkill | grep acer-wireless | awk '{ print $4 }') = "unblocked" ]; then
	wifi="WIFI |"
fi
if [ $(rfkill | grep bluetooth | awk '{ print $4 }') = "unblocked" ]; then
	bt="BT |"
fi

echo $cpu_temp \| CPU: $cpu_usage \| RAM: $meminfo \| $wifi $bt  $battery_level \ \ \   $brightness \| VOL $volume \ \ \ $date_and_time \ 
