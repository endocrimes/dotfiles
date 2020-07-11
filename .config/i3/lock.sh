#!/usr/bin/env bash

# wget -q --spider http://google.com

image=/etc/background-image.png

# if [ $? -eq 0 ]; then
#   resolution=$(xrandr | grep \* | cut -d' ' -f4)
#   url="https://source.unsplash.com/random/$resolution?mountain"
#   wget -O /tmp/locker.jpg "$url"
#   sleep 5
#   image=/tmp/locker.jpg
# fi

i3lock -fi "$image"
