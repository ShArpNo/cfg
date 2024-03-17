#!/usr/bin/env bash

toggle=$(amixer sget Master | tail -n1 | cut -d "[" -f3 | cut -d "]" -f1)

if [ $toggle = "on" ]
then
  echo $(amixer sget Master | tail -n1 | cut -d "[" -f2 | cut -d "]" -f1)
else
  echo "Muted"
fi

