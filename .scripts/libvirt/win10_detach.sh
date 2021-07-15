#!/bin/bash

cd "$(dirname "$0")"

virsh detach-device win10 kb.xml &&
	virsh detach-device win10 mouse.xml &&
	ddcutil setvcp 60 0x0f
