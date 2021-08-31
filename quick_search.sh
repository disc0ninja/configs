#! /bin/bash


if [ "$(which lynx 2&> /dev/null)" ]
then
  echo "Lynx is not installed."
  exit 1
fi

lynx "https://lite.duckduckgo.com/lite?q=$*&kp=-1&kd=-1"
