#!/bin/sh

WIN10_STATE=$(virsh list --all | awk '/win10/ {print $3}')

if [[ $WIN10_STATE = "running" ]]; then
	echo "  W10 VM running"
else
	echo ""
fi
