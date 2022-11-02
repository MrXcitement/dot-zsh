#!/bin/zsh

# pyenv.zsh --- initialize pyenv
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

if [[ $(command -v pyenv) ]]; then
    eval "$(pyenv init -)"
fi
