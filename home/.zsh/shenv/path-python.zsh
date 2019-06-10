#!/bin/zsh

# path-python.zsh --- configure the path for python installs

path=(
    ~/Library/Python/3.7/bin
    ~/Library/Python/2.7/bin
    $path
)
path=($^path(N))
