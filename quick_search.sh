#! /bin/sh

QUERY=$@
which lynx

if [ $? -ne 0 ]
then
  echo "Lynx is not installed."
  exit 1
fi

lynx -vikeys https://duckduckgo.com/?q=$QUERY
