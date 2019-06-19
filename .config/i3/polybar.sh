#!/usr/bin/env bash

pkill polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

wal -R
polybar example 2>&1 | tee $HOME/poly.log &

echo "Polybar launched"
