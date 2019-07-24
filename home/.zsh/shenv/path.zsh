#!/bin/zsh

# path.zsh --- configure the path
# Mike Barker <mike@thebarkers.com>
# July 24th, 2019

path=(
    ~/bin
    ~/.local/bin
    ~/Library/Python/3.7/bin
    ~/Library/Python/2.7/bin
    $path
)
path=($^path(N))
