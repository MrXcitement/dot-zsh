#!/bin/zsh

# .zlogin --- Run for login shells
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

# Load the login zsh scripts from ~/.zsh/login

SCRIPT_DIR="${${(%):-%x}:h}"
ZSH_DIR=${SCRIPT_DIR}/.zlogin.d/

[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh(N)) source $f

