# =============================================================================
#                                 Completions
# =============================================================================

fpath=($HOME/.local/share/zsh/site-functions $fpath)

# ---------------------------------------------------------- Brew [PATH]
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  fpath=($(brew --prefix)/share/zsh/site-functions ${fpath})
fi

# ---------------------------------------------------------- Nix [PATH]
# Save current values of local_options and shwordsplit
local_options_status=$(setopt | grep local_options)
shwordsplit_status=$(setopt | grep shwordsplit)

# Set the options
setopt local_options shwordsplit

# Add Nix profiles to fpath if nix command is available
if command -v nix >/dev/null 2>&1; then
  for profile in $NIX_PROFILES; do
    profile_path="$profile/share/zsh/site-functions"
    [ -d "$profile_path" ] && fpath+=("$profile_path")
  done
fi

# Revert to original values
[[ -z "$local_options_status" ]] && unsetopt local_options
[[ -z "$shwordsplit_status" ]] && unsetopt shwordsplit

# ---------------------------------------------------------- Config/Load
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
