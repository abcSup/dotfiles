#!/bin/bash

ws1="1:"
ws2="2:"
ws3="3:"

i3-msg "workspace $ws1; append_layout $HOME/.config/i3/workspace-1.json;"
chromium &
uxterm &

i3-msg "workspace $ws2; append_layout $HOME/.config/i3/workspace-2.json;"
uxterm -name left -e vim &
uxterm &
uxterm &
uxterm &

i3-msg "workspace $ws1;"
