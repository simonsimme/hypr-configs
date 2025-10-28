#!/bin/sh
# Show current power profile or switch to next on click aa

if [ "$1" = "switch" ]; then
  current=$(powerprofilesctl get)
  case "$current" in
    power-saver)
      next="balanced" ;;
    balanced)
      next="performance" ;;
    performance)
      next="power-saver" ;;
    *)
      next="power-saver" ;;
  esac
  powerprofilesctl set "$next"
  echo "$next"
else
  powerprofilesctl get
fi