# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ADOTDIR=$HOME/.config/antigen/
source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme amuse

# Tell antigen that you're done.
antigen apply

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-paraiso.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Virtualenv setup
export WORKON_HOME=~/VirtualEnvs
VIRTUALENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
[[ -s $VIRTUALENVWRAPPER ]] && source $VIRTUALENVWRAPPER

# Load custom dircolors
eval `dircolors ~/.dir_colors`
