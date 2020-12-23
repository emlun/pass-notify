#!/bin/bash

output=$(cmd_show "$@" | head -n1)

notify-send -a "${PROGRAM}" -u normal -t 2000 "Password copied" "$output"
