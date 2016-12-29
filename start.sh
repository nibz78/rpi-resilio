#!/bin/sh

FILE=etc/rslsync.conf

if [ ! -f $FILE ]
then
	cp /rslsync.conf $FILE
fi

sed -i -- "s/PI_HOSTNAME/${HOSTNAME}/g" $FILE

./bin/rslsync --config $FILE --nodaemon
