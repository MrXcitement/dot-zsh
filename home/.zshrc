#!/bin/zsh
# .zshrc --- Configure zsh interactive shells
# Mike Barker <mike@thebarkers.com>
# November 3rd, 2022

# Define the location for oh-my-zsh and custom plugins and themes
ZSH=${HOME}/.oh-my-zsh
ZSH_CUSTOM=${ZSH}/custom

# Clone the oh-my-zsh reposiotry
if [[ ! -d $ZSH ]]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
fi

# Clone spaceship-prompt/spaceship-prompt
if [[ ! -d $ZSH_CUSTOM/themes/spaceship-prompt ]]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt --depth=1
    ln -s $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme
fi

# Clone zsh-users/zsh-autosuggestions
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

# Clone zsh-users/zsh-completions
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions
    FPATH+=${ZSH_CUSTOM}/plugins/zsh-completions/src
fi

# Clone zsh-users/zsh-syntax-highlighting
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# Clone qianxinfeng/zsh-vscode
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-vscode" ]]; then
    git clone https://github.com/qianxinfeng/zsh-vscode ${ZSH_CUSTOM}/plugins/zsh-vscode
fi

# Clone mrxcitement/zsh-bat
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-bat" ]]; then
    git clone https://github.com/mrxcitement/zsh-bat ${ZSH_CUSTOM}/plugins/zsh-bat
fi
export BAT_THEME_DARK=OneHalfDark
export BAT_THEME_LIGHT=OneHalfLight

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=robbyrusell

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Only setup a prompt if the term is not dumb (emacs shell)
if [[ $TERM != dumb ]]; then
    # If starship is installed and not running in xterm, use it
    if [[ $(command -v starship) ]] && [[ $TERM != xterm ]]; then
	# Starship Cross Platform Prompt
	# The minimal, blazing-fast, and infinitely customizable prompt for any shell!
	# https://starship.rs/
	# The ~/.config/starship.toml file is used to configure the prompt.
	eval "$(starship init zsh)"
    else
	# Spaceship theme
	# https://denysdovhan.com/spaceship-prompt/
	ZSH_THEME="spaceship"
	# Disable kubecontext
	export SPACESHIP_KUBECTL_CONTEXT_SHOW='false'
    fi
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    command-not-found
    dotenv
    emacs
    kubectl
    fzf
    git
    tmux
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vscode
    zsh-bat
    )

# Configure homebrew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if [[ $(command -v brew) ]]; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

# Configure zoxide shell support
# https://github.com/ajeetdsouza/zoxide
if [[ $(command -v zoxide) ]]; then
    eval "$(zoxide init zsh)"
fi

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

##
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
