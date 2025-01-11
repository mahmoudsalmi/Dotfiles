# -------------------------------------------------
#   ZSH | startup | prompt
#   - load prompt
# -------------------------------------------------
function ms_zsh_startup_prompt {
  if command -v fastfetch >/dev/null; then
    fastfetch
  fi

  # if command -v pfetch >/dev/null; then
  #   pfetch --stat
  # fi

  znap eval starship "starship init zsh"
  znap prompt
}

# -------------------------------------------------
#   ZSH | startup | load some dev tools
#   - load luarocks
#   - load rust
#   - load fnm
#   - load angular
#   - load pnpm
#   - load sdkman
# -------------------------------------------------
function __ms_zsh_startup_dev_tools() {
  # ---------------------------------------------------------- Lua [PATH Luarocks]
  [ -d $HOME/.luarocks/bin ] && export PATH=$HOME/.luarocks/bin:$PATH

  # ---------------------------------------------------------- Rust [PATH cargo]
  [ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH
  if command -v rustup >/dev/null; then
    znap fpath _rustup 'rustup  completions zsh'
    znap fpath _cargo 'rustup  completions zsh cargo'
  fi

  # ---------------------------------------------------------- Nodejs [FNM]
  if [ -d $HOME/.fnm ]; then
    export PATH=$HOME/.fnm:$PATH
  elif [ -d $HOME/.local/share/fnm ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
  fi

  if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
    znap fpath _fnm 'fnm completions'
  fi

  # ---------------------------------------------------------- Nodejs [PNPM]
  export PNPM_HOME=$HOME/.local/share/pnpm
  mkdir -p $PNPM_HOME
  export PATH=$PNPM_HOME:$PATH

  if command -v pnpm >/dev/null; then
    znap fpath _pnpm 'pnpm completion zsh'
  fi

  # ---------------------------------------------------------- Nodejs [angular]
  if command -v ng >/dev/null; then
    znap fpath _ng 'ng completion script'
  fi

  # ---------------------------------------------------------- java/sdk [SDKMAN]
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

# -------------------------------------------------
#   ZSH | startup | update $PATH
#   - load dev tools
#   - load Rancher Desktop
#   - load snap
#   - load local bin
# -------------------------------------------------
function __ms_zsh_startup_path() {
  __ms_zsh_startup_dev_tools

  # ---------------------------------------------------------- Docker [Rancher Desktop]
  [ -d $HOME/.rd/bin ] && export PATH=$HOME/.rd/bin:$PATH

  # ---------------------------------------------------------- Snap [PATH]
  [ -d /snap/bin ] && export PATH=/snap/bin:$PATH

  # ---------------------------------------------------------- local bin [PATH]
  [ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH
}

# -------------------------------------------------
#   ZSH | startup | prompt
#   - load prompt
# -------------------------------------------------
function ms_zsh_startup_load {
  __ms_zsh_startup_path

  #-- custom --#
  [ -f "$MS_ZSH_CONFIG/custom/07_startup.zsh" ] && source "$MS_ZSH_CONFIG/custom/07_startup.zsh"
}
