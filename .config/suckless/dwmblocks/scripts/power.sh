#!/usr/bin/env bash

percent=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

if [ "$state" == "Charging" ]; then
    icon_battery="󱐋"
elif [ "$percent" -ge 90 ]; then
    icon_battery=" "
elif [ "$percent" -ge 60 ]; then
    icon_battery=" "
elif [ "$percent" -ge 30 ]; then
    icon_battery=" "
elif [ "$percent" -ge 10 ]; then
    icon_battery=" "
else
    icon_battery=" "
fi

printf "^c#83a598^%s^d^ %d" "$icon_battery" "$percent"
