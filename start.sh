#!/bin/sh

FILE=etc/rslsync.conf

if [ ! -f $FILE ]
then
	cp /rslsync.conf $FILE
fi

./bin/rslsync --config $FILE --nodaemon
