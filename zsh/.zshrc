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

# if dircolors exists
if type "dircolors" > /dev/null; then
    # Load custom dircolors
    [ -s ~/.dir_colors ] && eval `dircolors ~/.dir_colors`

    # colored completion - use my LS_COLORS
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

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
antigen theme bureau

# Tell antigen that you're done.
antigen apply

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Virtualenv setup
export WORKON_HOME=~/VirtualEnvs
VIRTUALENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
[[ -s $VIRTUALENVWRAPPER ]] && source $VIRTUALENVWRAPPER

# Adding rbenv to path
[ -d $HOME/.rbenv ] && export PATH="$HOME/.rbenv/bin:$PATH"
[ -d $HOME/.rbenv ] && eval "$(rbenv init -)"
