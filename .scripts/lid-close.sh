#!/bin/bash

set -euo pipefail

niri msg outputs | grep -F Output | grep -Fvq eDP-1 && exit 0

hyprlock &
systemctl suspend-then-hibernate
