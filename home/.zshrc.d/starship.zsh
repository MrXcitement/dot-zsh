#!/bin/zsh
# starship.zsh
# Initialize and configure the starship prompt
# Mike Barker <mike@thebarkers.com>
# March 19th, 2021

# Starship Cross Platform Prompt
# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
# https://starship.rs/
# The ~/.config/starship.toml file is used to configure the prompt.

if type "starship" > /dev/null; then
    eval "$(starship init zsh)"
fi
