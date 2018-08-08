#!/bin/bash

# Shell script to be run from xbindkeys to toggle between a visible console and
# a hidden console

consolefocus=$(xdotool getwindowfocus getwindowname | grep -c "Tmux_Shell")

if [ "$consolefocus" -gt "0" ]; then
    xdotool windowminimize $(xdotool getactivewindow)
else
    # Try to raise the Tmux_Shell but if it fails, start the one
    # tmux shell in a gnome-terminal
    wmctrl -a "Tmux_Shell" || gnome-terminal -e tmux_shell.sh
fi
