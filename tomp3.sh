#!/bin/sh
#convert to mp3
bitrate=`avconv -i "$1" 2>&1|sed -nr '/Audio\:/{s,^.* ([0-9]+) (.)b/s.*$,\1\2,g;p}'`
avconv -i $1 -b:a $bitrate "${2:-${1%.*}.mp3}"
