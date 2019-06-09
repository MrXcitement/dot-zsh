
# Disable kubecontext
export SPACESHIP_KUBECONTEXT_SHOW='false'

path=(
    ~/Library/Python/3.7/bin
    ~/Library/Python/2.7/bin
    $path
)

# Pyenv setup
if [[ $(command -v pyenv) ]]; then
    path=(~/.pyenv/bin $path)
    eval "$(pyenv init -)"
    if [[ $(command -v pyenv-sh-virtualenv) ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi
