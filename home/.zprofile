#!/bin/zsh

# .zprofile --- Run before .zshrc for login shells
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

# Load the profile zsh scripts from ~/.zsh/profile
SCRIPT_DIR="${${(%):-%x}:h}"
ZSH_DIR=${SCRIPT_DIR}/.zsh/profile/

[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh) source $f

