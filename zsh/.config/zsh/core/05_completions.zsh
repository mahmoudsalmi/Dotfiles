# -------------------------------------------------
#   ZSH | completions | update fpath
#   - add local fpath
#   - add nix fpath
#   - deduplicate
# -------------------------------------------------
function __update_fpath() {
  #-- add local fpath --#
  fpath=($HOME/.local/share/zsh/site-functions $fpath)

  #-- Add Nix profiles to fpath if nix command is available --#
  if command -v nix >/dev/null 2>&1; then
    local_options_status=$(setopt | grep local_options)
    shwordsplit_status=$(setopt | grep shwordsplit)
    setopt local_options shwordsplit
    for profile in $NIX_PROFILES; do
      profile_path="$profile/share/zsh/site-functions"
      [ -d "$profile_path" ] && fpath+=("$profile_path")
    done
    [[ -z "$local_options_status" ]] && unsetopt local_options
    [[ -z "$shwordsplit_status" ]] && unsetopt shwordsplit
  fi
  
  #-- deduplicate fpath --#
  fpath=(${(u)fpath})
}

# -------------------------------------------------
#   ZSH | completions | load
#   - customize and load zsh completions
# -------------------------------------------------
function __load_completions() {
  _comp_options+=(globdots)		# Include hidden files.

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
}

# -------------------------------------------------
#   ZSH | completions
#   - update fpath
#   - load completions
#   - custom completions
# -------------------------------------------------
function ms_zsh_completions() {
  __update_fpath
  __load_completions
  [ -f "$MS_ZSH_CONFIG/custom/05_completions.zsh" ] && source "$MS_ZSH_CONFIG/custom/05_completions.zsh"
}

