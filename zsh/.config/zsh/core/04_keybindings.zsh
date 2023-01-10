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
bindkey -s '^f' 'fzfp\n'

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
#                                custom Key Bindings
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/04_keybindings.zsh" ] && source "$MS_ZSH_CONFIG/custom/04_keybindings.zsh"
