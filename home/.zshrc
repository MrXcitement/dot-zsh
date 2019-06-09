#!/bin/zsh

# My personal zsh configuration
# Mike Barker <mike@thebarkers.com>
# June 8th, 2019
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle fasd
antigen bundle git
antigen bundle tmux
antigen bundle command-not-found

# Bundles from GitHub
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hkupty/ssh-agent

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

