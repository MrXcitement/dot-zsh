# dot-zsh
## Archived on 3/16/2024
I have migrated this configuration into my chezmoi [dotfiles](https://github.com/mrxcitement/dotfiles) repository.
<hr>
My personal 'zsh' shell configuration files.

## System
Configured to work on the following systems:
* OS X 10.9+

## Install
```
$ ./install
```

## Configuration
I use ['oh-my-zsh'](https://ohmyz.sh/) to manage my zsh configuration.
Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration..

## Notes

### Path issues
On macOS, if you set the path in the *recommended* file `~/.zshenv` the system will overwrite it when it runs `/etc/zprofile` later in the startup.
My solution is to source the `~/.zshenv` file in `~/.zprofile` if running on macOS aka 'Darwin'.

