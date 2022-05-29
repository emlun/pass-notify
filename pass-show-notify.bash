#!/bin/bash



if output=$(cmd_show "$@" | head -n1); then
  notify-send -a "${PROGRAM}" -u normal -t 2000 "Password copied" "$output"
else
  notify-send -a "${PROGRAM}" -u critical -t 5000 "Failed to copy password" "$output"
fi
