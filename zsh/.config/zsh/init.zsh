# ========================================================================
# 	                           Variables
# ========================================================================

# MS Variables
source $MS_ZSH_CONFIG/variables.sh

# Fix Locale
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

# fix java version
if [[ $OSTYPE = (darwin)* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 15`
fi

# custom PATH
export PATH=$HOME/.local/bin:$PATH:$HOME/.cargo/bin

# ========================================================================
# 				ZSH | Plugins
# ========================================================================
export ZPLUG_HOME="$MS_SL_REPO/zplug"
source $ZPLUG_HOME/init.zsh

zplug "k4rthik/git-cal", as:command
zplug "b4b4r07/enhancd", use:init.sh

# ZSH history database
HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
zplug "larkery/zsh-histdb", use:"{sqlite-history,histdb-interactive}.zsh"

zplug "zdharma-continuum/fast-syntax-highlighting"

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copydir",           from:oh-my-zsh
zplug "plugins/copyfile",          from:oh-my-zsh
zplug "plugins/dircycle",          from:oh-my-zsh
zplug "plugins/encode64",          from:oh-my-zsh
zplug "plugins/extract",           from:oh-my-zsh
zplug "plugins/urltools",          from:oh-my-zsh
zplug "plugins/web-search",        from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh
zplug "plugins/fancy-ctrl-z",      from:oh-my-zsh

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux",     from:oh-my-zsh, if:"(( $+commands[pacman] ))"
    zplug "plugins/dnf",           from:oh-my-zsh, if:"(( $+commands[dnf] ))"
    zplug "plugins/mock",          from:oh-my-zsh, if:"(( $+commands[mock] ))"
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "lib/clipboard",         from:oh-my-zsh
    zplug "plugins/macos",         from:oh-my-zsh
    zplug "plugins/brew",          from:oh-my-zsh, if:"(( $+commands[brew] ))"
fi

zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/golang",            from:oh-my-zsh, if:"(( $+commands[go] ))"
zplug "plugins/svn",               from:oh-my-zsh, if:"(( $+commands[svn] ))"
zplug "plugins/node",              from:oh-my-zsh, if:"(( $+commands[node] ))"
zplug "plugins/npm",               from:oh-my-zsh, if:"(( $+commands[npm] ))"
zplug "lib/nvm",                   from:oh-my-zsh, if:"(( $+commands[nvm] ))"
zplug "plugins/pip",               from:oh-my-zsh, if:"(( $+commands[pip] ))"
zplug "plugins/sudo",              from:oh-my-zsh, if:"(( $+commands[sudo] ))"
zplug "plugins/gpg-agent",         from:oh-my-zsh, if:"(( $+commands[gpg-agent] ))"
zplug "plugins/systemd",           from:oh-my-zsh, if:"(( $+commands[systemctl] ))"
zplug "plugins/docker",            from:oh-my-zsh, if:"(( $+commands[docker] ))"
zplug "plugins/docker-compose",    from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"

zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# =============================================================================
#                        Install/Config/Load Plugins
# =============================================================================

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# HistDB : import old history
if zplug check "larkery/zsh-histdb"; then
    if [ ! -f "$HOME/.histdb/zsh-history.db" ]; then
        echo "Import your old zsh history with github.com/drewis/go-histdbimport"
    fi
fi

# Config Enhaced cd
if zplug check "b4b4r07/enhancd"; then
    ENHANCD_FILTER="fzf"
    ENHANCD_COMMAND="c"
fi

# Then Load
zplug load

# ========================================================================
# 				ZSH | Options
# ========================================================================
autoload -Uz add-zsh-hook
autoload edit-command-line; zle -N edit-command-line

# Enable colors and change prompt:
autoload -Uz colors && colors

# Basic auto/tab complete:
autoload -Uz compinit

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history         # Also record time and duration of commands.
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt share_history            # Share history between multiple shells
setopt transient_rprompt

# =============================================================================
#                                Key Bindings
# =============================================================================

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrows keys
bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# Edit line in vim with ctrl-e:
bindkey '^v' edit-command-line

# search in current PWD
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# searh caret
if zplug check "larkery/zsh-histdb"; then
    bindkey '^r' _histdb-isearch
fi

# search nav
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey "^[[1;5A" history-substring-search-up
    bindkey "^[[1;5B" history-substring-search-down
fi

# =============================================================================
#                                 Completions
# =============================================================================


zstyle ':completion:*' menu select
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


# =============================================================================
#                                 Alias
# =============================================================================

alias vi=nvim
alias vim=nvim

alias ls='exa --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -l -snew --color=always --group-directories-first' # tree listing
alias l='exa -al -snew --color=always --group-directories-first'

alias wk="cd ~/_work/_wk"

alias kfront="cd ~/_work/_wk/_repo/Front/KOLFront"
alias kmobile="cd ~/_work/_wk/_repo/Front/KOLFront/projects/@wk-kol/mobile"
alias klib="cd ~/_work/_wk/_repo/Front/KOLFront/projects/wk-kol-lib"

alias kserve="cd ~/_work/_wk/_repo/Front/KOLFront; ng serve --proxy-config proxy.conf.json"
alias kbuild="cd ~/_work/_wk/_repo/Front/KOLFront; ng build --base-href /kolmobile/"
alias klint="cd ~/_work/_wk/_repo/Front/KOLFront; ng lint"

# =============================================================================
#                               StartUp
# =============================================================================

# FNM
eval "$(fnm env --use-on-cd)"

# Starship Prompt
eval "$(starship init zsh)"

# Haskell
[ -f "/Users/mahmoud.salmi/.ghcup/env" ] && source "/Users/mahmoud.salmi/.ghcup/env" # ghcup-env

# nnn file manager
[ -f "$HOME/.config/nnn/init_nnn.zsh" ] && source "$HOME/.config/nnn/init_nnn.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/mahmoud.salmi/.local/lib/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/mahmoud.salmi/.local/lib/miniconda/etc/profile.d/conda.sh" ]; then
#         . "/Users/mahmoud.salmi/.local/lib/miniconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/mahmoud.salmi/.local/lib/miniconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<



neofetch
