# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
zstyle ':completion:*' menu select

ENABLE_CORRECTION="true"

plugins=(git tmux z)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias zshconfig="nvim ~/.zshrc"
