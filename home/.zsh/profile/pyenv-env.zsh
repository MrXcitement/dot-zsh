# pyenv-env.zsh --- Add PYENV_ROOT and add it to the path
# Mike Barker <mike@thebarkers.com>
# May 25th, 2021

if [[ -d ${HOME}/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi
