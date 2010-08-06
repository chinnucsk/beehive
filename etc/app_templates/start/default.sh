#!/bin/sh -e

echo "Starting $NAME:$PORT"

echo $$ > $PIDFILE


echo "Use start file? `pwd`"
if [ -f start.sh ]; then
  echo "Using start.sh file"
  exec /bin/sh start.sh
elif [ -f config.ru ]; then
  exec thin -R config.ru -p $PORT start
fi