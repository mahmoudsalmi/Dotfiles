# -------------------------------------------------
#   ZSH | alias | alias
#   - define aliases
# -------------------------------------------------
function __ms_zsh_alias() {

  # alias ls='exa --color=always --group-directories-first' # my preferred listing
  # alias ls='ls '
  alias la='eza -al --color=always --group --group-directories-first'      # all files and dirs
  alias ll='eza -l --color=always --group --group-directories-first'       # long format
  alias lt='eza -l -snew --color=always --group --group-directories-first' # tree listing
  alias l='eza -al -snew --color=always --group --group-directories-first'

  alias fzfp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

  alias vi=nvim
  alias vim=nvim

  alias :q=exit
}

# -------------------------------------------------
#   ZSH | alias | functions
#   - define utils functions
# -------------------------------------------------
function __ms_zsh_functions() {

  function batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
  }

  function t() {
    tail -f "$@" | bat --paging=never -l log
  }

  {
    typeset -fx batdiff
    typeset -fx t
  } >/dev/null 2>&1
}

# -------------------------------------------------
#   ZSH | alias
#   - define aliases and utils functions
# -------------------------------------------------
function ms_zsh_alias() {
  __ms_zsh_alias
  __ms_zsh_functions
  [ -f "$MS_ZSH_CONFIG/custom/06_aliases.zsh" ] && source "$MS_ZSH_CONFIG/custom/06_aliases.zsh"
}
