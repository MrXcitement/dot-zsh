#!/bin/zsh

# 00-antigen.zsh --- initialize and configure the antigen plugin manager
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

# Download and source the antigen plugin system
local ANTIGEN_DIR="${HOME}/.antigen"
local ANTIGEN="${ANTIGEN_DIR}/antigen.zsh"

if [[ ! -d "${ANTIGEN_DIR}" ]]; then
    mkdir -p "${ANTIGEN_DIR}"
fi
if [[ ! -e "${ANTIGEN}" ]]; then
    curl -L git.io/antigen > ${ANTIGEN}
fi
source "${ANTIGEN}"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle fasd
antigen bundle geeknote
antigen bundle git
antigen bundle tmux
antigen bundle command-not-found

# Bundles from GitHub
antigen bundle hkupty/ssh-agent
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle qianxinfeng/zsh-vscode

# Load the theme.
if ! type "starship" > /dev/null; then
    antigen theme denysdovhan/spaceship-prompt
fi

# Tell Antigen that you're done.
antigen apply
