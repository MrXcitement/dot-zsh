#!/bin/zsh

# 00-antigen.zsh --- initialize and configure the antigen plugin manager
# Mike Barker <mike@thebarkers.com>
# June 9th, 2019

# Download and source the antigen plugin system
local ANTIGEN_DIR="${HOME}/.antigen"
local ANTIGEN="${ANTIGEN_DIR}/antigen.zsh"
if [[ ! -e "${ANTIGEN}" ]]; then
    mkdir -p "${ANTIGEN_DIR}"
    curl -L git.io/antigen > ${ANTIGEN}
fi
source "${ANTIGEN}"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle fasd
antigen bundle git
antigen bundle tmux
antigen bundle command-not-found

# Bundles from GitHub
[[ -d ~/.ssh ]] && antigen bundle hkupty/ssh-agent
[[ $(command -v code) ]] && antigen bundle qianxinfeng/zsh-vscode
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme spaceship-prompt/spaceship-prompt

# Tell Antigen that you're done.
antigen apply
