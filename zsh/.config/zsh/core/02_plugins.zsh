# ========================================================================
# 				ZSH | Plugins
# ========================================================================
source $ZPLUG_HOME/init.zsh

zplug "k4rthik/git-cal", as:command
zplug "b4b4r07/enhancd", use:init.sh

# ZSH history database
if [[ $OSTYPE = (darwin)* ]]; then
  HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
fi
zplug "larkery/zsh-histdb", use:"{sqlite-history,histdb-interactive}.zsh"

zplug "zdharma-continuum/fast-syntax-highlighting"

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/copypath",           from:oh-my-zsh
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

#zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))"
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
zplug "fdellwing/zsh-bat"
zplug "wfxr/forgit"
zplug "nix-community/nix-zsh-completions", defer:3

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

# =============================================================================
#                        Load custom plugins
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/02_plugins.zsh" ] && source "$MS_ZSH_CONFIG/custom/02_plugins.zsh"

# =============================================================================
#                        Then Load
# =============================================================================
zplug load

