# -------------------------------------------------
#   ZSH | plugins | INIT
#   - load zsh plugins manager [znap]
#   - init homebrew (macos)
# -------------------------------------------------
function ms_zsh_plugins_init() {
  #-- fix zsh plugins path --#
  export ZSH_PLUGINS_PATH="$HOME"/.local/share/zsh/plugins

  #-- check if exists, and install it if not --#
  if ! [[ -r "$ZSH_PLUGINS_PATH"/znap/znap.zsh ]]; then
    mkdir -p "$ZSH_PLUGINS_PATH"
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git "$ZSH_PLUGINS_PATH"/znap
  fi

  #-- load znap --#
  source "$ZSH_PLUGINS_PATH"/znap/znap.zsh

  #-- load homebrew (macos)        --#
  #--    TODO: load linux homebrew --#
  if [ -f /opt/homebrew/bin/brew ]; then
    znap eval "brew-init" "/opt/homebrew/bin/brew shellenv"
    fpath=($(brew --prefix)/share/zsh/site-functions ${fpath})
  fi
}

# -------------------------------------------------
#   ZSH | plugins | LOAD
#   - load choosing plugins
# -------------------------------------------------
function ms_zsh_plugins_load() {
  ENHANCD_FILTER="fzf"
  ENHANCD_COMMAND="c"
  znap source "b4b4r07/enhancd" init.sh

  znap source "zsh-users/zsh-completions"
  znap source "zsh-users/zsh-autosuggestions"
  znap source "zsh-users/zsh-syntax-highlighting"

  znap source "ajeetdsouza/zoxide"

  #-- load custom plugins --#
  [ -f "$MS_ZSH_CONFIG/custom/02_plugins.zsh" ] && source "$MS_ZSH_CONFIG/custom/02_plugins.zsh"
}

# -------------------------------------------------
#   ZSH | plugins | LOAD COMPLETIONS
#   - load plugins completions
# -------------------------------------------------
function ms_zsh_plugins_load_completions() {
  #-- (TODO) --#
}

# -------------------------------------------------
#   ZSH | plugins | LOAD POST COMPLETIONS
#   - load plugins that need completions be loaded
# -------------------------------------------------
function ms_zsh_plugins_load_post_completions() {
  znap source "hlissner/zsh-autopair"
  znap source "atuinsh/atuin"
}
