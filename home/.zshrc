#!/bin/zsh

# .zshrc --- Run for interactive shells
# Mike Barker <mike@thebarkers.com>
# June 8th, 2019

# Load all files in the ~/.zsh/rc folder

SCRIPT_DIR="${${(%):-%x}:h}"
ZSH_DIR=${SCRIPT_DIR}/.zshrc.d/

[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh) source $f

