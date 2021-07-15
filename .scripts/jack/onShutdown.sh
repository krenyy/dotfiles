#!/bin/bash

SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

PID_FILE=$SCRIPT_DIR/pids

{
	while read PID; do
		kill $PID
	done <$PID_FILE

	rm $PID_FILE

	pactl unload-module module-jack-sink
	pactl unload-module module-jack-source

} >../.logs/"$(basename -s.sh "$0")".log
