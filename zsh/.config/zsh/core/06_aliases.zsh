# =============================================================================
#                                 Alias
# =============================================================================

alias vi=nvim
alias vim=nvim

# alias ls='exa --color=always --group-directories-first' # my preferred listing
alias ls='ls --color=auto'
alias la='exa -al --color=always --group --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group --group-directories-first'  # long format
alias lt='exa -l -snew --color=always --group --group-directories-first' # tree listing
alias l='exa -al -snew --color=always --group --group-directories-first'

alias fzfp="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias :q=exit


# =============================================================================
#                                Funtions
# =============================================================================

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

t() {
    tail -f "$@" | bat --paging=never -l log
}

# =============================================================================
#                                 Custom Alias
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/06_aliases.zsh" ] && source "$MS_ZSH_CONFIG/custom/06_aliases.zsh"
