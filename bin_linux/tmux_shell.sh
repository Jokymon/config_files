#!/bin/bash
# Set a clearly identifiable window title so we can refer to it from wmctrl an
# xdotool
echo -ne "\033]0;Tmux_Shell\007"
bash
