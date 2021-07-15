#!/bin/bash

SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR

PID_FILE=$SCRIPT_DIR/pids

{

	jack_mixer -c $XDG_CONFIG_HOME/jack_mixer/state.xml &
	echo $! >>$PID_FILE
	calfjackhost -l $XDG_CONFIG_HOME/calf/state.xml &
	echo $! >>$PID_FILE
	reaper $XDG_DATA_HOME/reaper/default.RPP &
	echo $! >>$PID_FILE

	pactl load-module module-jack-sink channels=2
	pactl load-module module-jack-source channels=2

	jack_disconnect system:capture_1 PulseAudio\ JACK\ Source:front\-left
	jack_disconnect system:capture_2 PulseAudio\ JACK\ Source:front\-right

	jack_disconnect PulseAudio\ JACK\ Sink:front\-left system:playback_1
	jack_disconnect PulseAudio\ JACK\ Sink:front\-right system:playback_2

} >../.logs/"$(basename -s.sh "$0")".log
