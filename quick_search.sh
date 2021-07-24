#! /bin/sh

for query_string in $@ 
do
 QUERY="$QUERY%20$query_string" 
 echo "$QUERY"
done
which lynx 2> /dev/null

if [ $? -ne 0 ]
then
  echo "Lynx is not installed."
  exit 1
fi

lynx -vikeys https://duckduckgo.com/?q=$QUERY
