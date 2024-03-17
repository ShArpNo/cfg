#!/usr/bin/env bash

echo $(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | cut -c 26-28)
