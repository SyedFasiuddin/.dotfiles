#!/bin/sh

# All apple CLI tools (git, clang etc)
xcode-select --install

# Set wallpaper
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/Solid Colors/Stone.png"'
