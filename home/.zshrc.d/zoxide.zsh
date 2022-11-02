# zoxide.zsh -- Initialize zoxide shell support, if installed
# https://github.com/ajeetdsouza/zoxide
# Mike Barker <mike@thebarkers.com>
# May 19th 2022

if type "zoxide" > /dev/null; then
    eval "$(zoxide init zsh)"
fi
