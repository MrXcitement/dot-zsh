#!/bin/zsh

# .zlogout --- Run at logout
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

SCRIPT_DIR="${${(%):-%x}:h}"
ZSH_DIR=${SCRIPT_DIR}/.zsh/logout/

[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh(N)) source $f

