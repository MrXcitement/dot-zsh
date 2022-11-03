#!/bin/zsh

# .zshenv --- Usually run for every zsh
# Mike Barker <mike@thebarkers.com>
# November 3rd, 2022


# Export environment key-value files in ~/.env directory
if [[ -d ${HOME}/.env ]]; then
    for f (${HOME}/.env/*.env); do
        export $(cat $f | sed -e /^$/d -e /^#/d | xargs)
    done
fi

# Configure the path

# If on macos, use path_helper to seed the path
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
    # I modified /etc/zprofile to not eval the path_helper if
    # NO_PATH_HELPER exists.
    # This keeps the path from getting clobbered by path_helper.
    NO_PATH_HELPER=1
fi


# Add before existing path
newpath+=(
~/bin
~/.local/bin
~/.dotnet/tools
/opt/microsoft/bin)

# Add existing path
newpath+=($path)

# Add after existing path
newpath+=(/usr/local/sbin)

# Compose the path from the newpath array,
# only existing paths will be added to the new path.
path=($^newpath(N))


# Configure homebrew environment
BREW=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    test -x "/opt/homebrew/bin/brew" && BREW=/opt/homebrew/bin/brew

elif [[ "$OSTYPE" == "linux-gnu"* ]] then
    test -d "$HOME/.linuxbrew" && BREW="$HOME/.linuxbrew/bin/brew"
    test -d "/home/linuxbrew/.linuxbrew" && BREW="/home/linuxbrew/.linuxbrew/bin/brew"
fi
    
# Use brew command to set shell environment
if [[ "$BREW" != "" ]]; then
    eval "$($BREW shellenv)"
fi
unset BREW

# Configure pyenv environment
if [[ -d ${HOME}/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
