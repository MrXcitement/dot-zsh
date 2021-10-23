#!/usr/bin/env zsh
# homebrew.zsh -- setup the homebrew shell environment

# Mike Barker <mike@thebarkers.com>
# October 22nd, 2021

# Test for brew command
BREW=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    test -x "/opt/homebrew/bin/brew" && BREW=/opt/homebrew/bin/brew

elif [[ "$OSTYPE" == "linux-gnu"* ]] then
    test -d "$HOME/.linuxbrew" && BREW="$HOME/.linuxbrew/bin/brew"
    test -d "/home/linuxbrew/.linuxbrew" && BREW="/home/linuxbrew/.linuxbrew/bin/brew"
fi
    
# Use brew command to set shell environment
if [[ "$BREW" != "" ]]; then
    eval "$($BREW shellenv)"
fi
unset BREW
