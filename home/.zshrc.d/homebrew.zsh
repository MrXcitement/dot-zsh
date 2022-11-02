# homebrew.zsh --- Configure homebrew
# Mike Barker <mike@thebarkers.com>
# October 23rd, 2021

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
