# -------------------------------------------------
#   ZSH | SetOpt
#   - customize zsh options
# -------------------------------------------------
function ms_zsh_keybinding() {
  #-- vi mode --#
  bindkey -v
  export KEYTIMEOUT=1

  #-- Common CTRL bindings --#
  bindkey "^a" beginning-of-line
  bindkey "^e" end-of-line

  #-- Fixes for alt-backspace and arrows keys --#
  bindkey '^[^?' backward-kill-word
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word

  #-- Edit line in vim with ctrl-v --#
  bindkey '^v' edit-command-line

  #-- search/edit in current PWD --#
  bindkey -s '^f' 'fzfp\n'
  bindkey -s '^g' 'vi $(fzfp)\n'

  #-- custom keybinding --#
  [ -f "$MS_ZSH_CONFIG/custom/04_keybindings.zsh" ] && source "$MS_ZSH_CONFIG/custom/04_keybindings.zsh"
}
