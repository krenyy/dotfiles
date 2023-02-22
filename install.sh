#!/bin/sh

cd "$(dirname "$0")"/dotfiles || (echo "cd failed" >&2 && exit)

stow -t "$HOME" */
