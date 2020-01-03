#!/bin/zsh

# path.zsh --- configure the path
# Mike Barker <mike@thebarkers.com>
# July 24th, 2019

# Create an array of potential paths to become the new path
newpath+=(~/bin)
newpath+=(~/bin/flutter/bin)
newpath+=(~/.local/bin)
newpath+=(~/Library/Python/3.7/bin)
newpath+=(~/Library/Python/2.7/bin)
newpath+=($path)

# Compose the path from the array of proposed paths.
# Only existing paths will be added to the new path.
path=($^newpath(N))
