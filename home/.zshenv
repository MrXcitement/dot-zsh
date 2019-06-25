#!/bin/zsh

# .zshenv --- Usually run for every zsh
# Mike Barker <mike@thebarkers.com>
# Jine 9th, 2019

# Load all the files in the ~/.zsh/shenv directory

SCRIPT_DIR=${${(%):-%x}:h}

# Export environment key-value files in ~/.env directory
if [[ -d ${HOME}/.env ]]; then
    [[ $DEBUG ]] && echo "Loading ${HOME}/.env"
    for f (${HOME}/.env/*.env); do
        [[ $DEBUG ]] && echo "Loading file $f"
        export $(cat $f | sed -e /^$/d -e /^#/d | xargs)
    done
fi

# Source environment files in the ~/.zsh/shenv directory
ZSH_DIR=${SCRIPT_DIR}/.zsh/shenv/
[[ $DEBUG ]] && echo "Loading ${ZSH_DIR}"
for f (${ZSH_DIR}/*.zsh) source $f

