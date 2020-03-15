#!/bin/sh


CUR_CLOCK="$(lscpu | grep 'CPU MHz' | awk '{printf "%.2f", $3/1000}')"
MIN_CLOCK="$(lscpu | grep 'CPU min MHz' | awk '{printf "%.2f", $4/1000}')"
MAX_CLOCK="$(lscpu | grep 'CPU max MHz' | awk '{printf "%.2f", $4/1000}')"

RANGE=$(awk '{print $1-$2}' <<< "$MAX_CLOCK $MIN_CLOCK")
STEP=$(awk '{print $1/4}' <<< "$RANGE")  # 5 tachometer icons

LEVEL=$(awk '{printf "%.0f", ($1-$2)/$3}' <<< "$CUR_CLOCK $MIN_CLOCK $STEP")

case $LEVEL in
    0) ICON="";;
    1) ICON="";;
    2) ICON="";;
    3) ICON="";;
    4) ICON="";;
esac

echo "$ICON $CUR_CLOCK GHz"

