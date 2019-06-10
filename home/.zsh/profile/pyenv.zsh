#!/bin/zsh

# pyenv.zsh --- initialize pyenv
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019


if [[ $(command -v pyenv) ]]; then
    path=(~/.pyenv/bin $path)
    eval "$(pyenv init -)"
    if [[ $(command -v pyenv-sh-virtualenv) ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
