# =============================================================================
#                               $PATH
# =============================================================================


# ---------------------------------------------------------- Lua [PATH Lua]
[ -d $HOME/.luarocks/bin ] && export PATH=$HOME/.luarocks/bin:$PATH

# ---------------------------------------------------------- Rust [PATH cargo]
[ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH

# ---------------------------------------------------------- Docker [Rancher Desktop]
[ -d $HOME/.rd/bin ] && export PATH=$HOME/.rd/bin:$PATH

# ---------------------------------------------------------- Snap [PATH]
[ -d /snap/bin ] && export PATH=/snap/bin:$PATH

# ---------------------------------------------------------- local bin [PATH]
[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

# =============================================================================
#                               Welcome
# =============================================================================
neofetch

# =============================================================================
#                              Development
# =============================================================================

# ---------------------------------------------------------- Nodejs [FNM]
if [ -d $HOME/.fnm ]; then
    export PATH=$HOME/.fnm:$PATH
    eval "`fnm env`"
    source <(fnm completions)
elif command -v fnm > /dev/null; then
    eval "$(fnm env --use-on-cd)"
    source <(fnm completions)
fi

# ---------------------------------------------------------- Nodejs [angular]
if command -v ng > /dev/null; then
    source <(ng completion script)
fi

# ---------------------------------------------------------- Nodejs [PNPM]
export PNPM_HOME=$HOME/.local/share/pnpm
mkdir -p $PNPM_HOME
export PATH=$PNPM_HOME:$PATH

# ---------------------------------------------------------- Haskell [GHC]
# [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# ---------------------------------------------------------- java/sdk [SDKMAN]
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"


# ---------------------------------------------------------- python [Pyenv]
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# =============================================================================
#                               StartUp Tools
# =============================================================================

# ---------------------------------------------------------- file manager [nnn]
[ -f "$HOME/.config/nnn/init_nnn.zsh" ] && source "$HOME/.config/nnn/init_nnn.zsh"

# ---------------------------------------------------------- Prompt [starship]
eval "$(starship init zsh)"


# =============================================================================
#                               Custom StartUp
# =============================================================================
[ -f "$MS_ZSH_CONFIG/custom/07_startup.zsh" ] && source "$MS_ZSH_CONFIG/custom/07_startup.zsh"
