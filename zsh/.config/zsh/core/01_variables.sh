# ========================================================================
# 	                           Variables
# ========================================================================

# Fix Locale
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export SHELL="/bin/zsh"
export TERM='xterm-256color'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# History in cache directory:
export HISTFILE=~/.cache/zsh/history
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE

# MS Variables
export MS_LOCAL="$HOME/.local"
export MS_SL="$MS_LOCAL/_suckless"
export MS_SL_REPO="$MS_SL/repo"
export MS_GIT_REPOS="$HOME/msdata/git/"

# ZPLUG_HOME
export ZPLUG_HOME="$MS_SL_REPO/zplug"
