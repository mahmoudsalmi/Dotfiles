# =============================================================================
#                                 Completions
# =============================================================================

fpath=($HOME/.local/share/zsh/site-functions $fpath)

# ---------------------------------------------------------- Brew [PATH]
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  fpath=($(brew --prefix)/share/zsh/site-functions ${fpath})
fi

# Basic auto/tab complete:
autoload -Uz compinit

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
#                                 Custom Completions
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/05_completions.zsh" ] && source "$MS_ZSH_CONFIG/custom/05_completions.zsh"
