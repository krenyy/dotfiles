#!/bin/sh

cd $(dirname $0)/dotfiles

stow */ -t ~/

