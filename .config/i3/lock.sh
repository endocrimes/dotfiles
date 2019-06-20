#!/usr/bin/env bash

i3lock -fi /etc/background-image.png

# If still locked after 5 seconds, turn off screen.
sleep 5 && pgrep i3lock && xset dpms force off
