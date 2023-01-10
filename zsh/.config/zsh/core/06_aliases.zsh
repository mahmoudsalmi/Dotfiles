# =============================================================================
#                                 Alias
# =============================================================================

alias vi=nvim
alias vim=nvim

alias ls='exa --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group --group-directories-first'  # long format
alias lt='exa -l -snew --color=always --group --group-directories-first' # tree listing
alias l='exa -al -snew --color=always --group --group-directories-first'

alias :q=exit

# =============================================================================
#                                 Custom Alias
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/06_aliases.zsh" ] && source "$MS_ZSH_CONFIG/custom/06_aliases.zsh"
