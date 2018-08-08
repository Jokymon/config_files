#!/bin/bash

sudo apt-get install wmctrl xbindkeys xdotool

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ ! -e "${HOME}/.vimrc" ]; then
    ln -s "${SCRIPTPATH}/.vimrc" "${HOME}/.vimrc"
fi
if [ ! -e "${HOME}/.Xsession" ]; then
    ln -s "${SCRIPTPATH}/.Xsession" "${HOME}/.Xsession"
fi
if [ ! -e "${HOME}/.xbindkeysrc" ]; then
    ln -s "${SCRIPTPATH}/.xbindkeysrc" "${HOME}/.xbindkeysrc"
fi

if [ ! -d "${HOME}/bin" ]; then
    mkdir "${HOME}/bin"
fi

ln -sf "${SCRIPTPATH}/bin_linux/ctail.sh" "${HOME}/bin/ctail"
ln -sf "${SCRIPTPATH}/bin_linux/tmux_shell.sh" "${HOME}/bin/tmux_shell.sh"
ln -sf "${SCRIPTPATH}/bin_linux/toggle_console.sh" "${HOME}/bin/toggle_console.sh"
