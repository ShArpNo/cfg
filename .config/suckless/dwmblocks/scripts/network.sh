#!/usr/bin/env bash

online=$(nm-online -t 1 | cut -d "[" -f2 | cut -d "]" -f1)

if [ $online = "online" ]
then
  echo $(nmcli connection show --active | sed -n '2p' | cut -d " " -f1);
else
  echo "net: Off"
fi
