#!/bin/bash

cd "$(dirname "$0")"

virsh attach-device win10 kb.xml &&
	virsh attach-device win10 mouse.xml &&
	ddcutil setvcp 60 0x12
