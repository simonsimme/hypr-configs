#!/bin/bash

choice=$(printf "▶ Play/Pause\n⏭ Next\n⏮ Previous\n⏹ Stop\n🔊 Volume Up\n🔉 Volume Down" | wofi --dmenu --prompt "YouTube Controls")

case "$choice" in
    "▶ Play/Pause") playerctl play-pause ;;
    "⏭ Next") playerctl next ;;
    "⏮ Previous") playerctl previous ;;
    "⏹ Stop") playerctl stop ;;
    "🔊 Volume Up") playerctl volume 0.05+ ;;
    "🔉 Volume Down") playerctl volume 0.05- ;;
esac
