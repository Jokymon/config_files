#!/bin/bash

rm -f "${HOME}/bin/ctail"

if [ -L "${HOME}/.vimrc" ]; then
    rm "${HOME}/.vimrc"
fi
