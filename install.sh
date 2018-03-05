#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ ! -e "${HOME}/.vimrc" ]; then
    ln -s "${SCRIPTPATH}/.vimrc" "${HOME}/.vimrc"
fi

if [ ! -d "${HOME}/bin" ]; then
    mkdir "${HOME}/bin"
fi

ln -s "${SCRIPTPATH}/bin_linux/ctail.sh" "${HOME}/bin/ctail"
