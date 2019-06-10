#!/bin/zsh

# .zshenv --- Usually run for every zsh
# Mike Barker <mike@thebarkers.com>
# Jine 9th, 2019

# Load all the files in the ~/.zsh/shenv directory

SCRIPT_DIR=${${(%):-%x}:h}
ZSH_DIR=${SCRIPT_DIR}/.zsh/shenv/

[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh) source $f

