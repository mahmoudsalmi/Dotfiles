# ========================================================================
# 				ZSH | Options
# ========================================================================
autoload -Uz add-zsh-hook
autoload edit-command-line; zle -N edit-command-line

# Enable colors and change prompt:
autoload -Uz colors && colors

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

# ========================================================================
# 				ZSH | custom Options
# ========================================================================
[ -f "$MS_ZSH_CONFIG/custom/03_opts.zsh" ] && source "$MS_ZSH_CONFIG/custom/03_opts.zsh"
