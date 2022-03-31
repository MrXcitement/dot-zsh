#!/bin/zsh

# path.zsh --- configure the path
# Mike Barker <mike@thebarkers.com>
# July 24th, 2019

# Create an array of potential paths to become the new path
[[ -x ~/bin ]] && newpath+=(~/bin)
[[ -x ~/.local/bin ]] && newpath+=(~/.local/bin)
[[ -x ~/.dotnet/tools ]] && newpath+=(~/.dotnet/tools)
[[ -x /opt/homebrew/bin ]] && newpath+=(/opt/homebrew/bin)
[[ -x /opt/microsoft/bin ]] && newpath+=(/opt/microsoft/bin)

newpath+=($path)

[[ -x /usr/local/sbin ]] && newpath+=(/usr/local/sbin)

# Compose the path from the array of proposed paths.
# Only existing paths will be added to the new path.
path=($^newpath(N))
