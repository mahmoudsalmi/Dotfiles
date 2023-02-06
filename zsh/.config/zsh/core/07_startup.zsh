# =============================================================================
#                               Welcome
# =============================================================================
neofetch

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

# ---------------------------------------------------------- Rust [PATH cargo]
[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

# =============================================================================
#                              Development
# =============================================================================

# ---------------------------------------------------------- Nodejs [FNM]
if [ -d $HOME/.fnm ]; then
    export PATH=$HOME/.fnm:$PATH
    eval "`fnm env`"
elif command -v fnm > /dev/null; then
    eval "$(fnm env --use-on-cd)"
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


# ---------------------------------------------------------- python [MiniConda]
# __conda_setup="$('$HOME/.local/lib/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "$HOME/.local/lib/miniconda/etc/profile.d/conda.sh" ]; then
#         . "$HOME/.local/lib/miniconda/etc/profile.d/conda.sh"
#     else
#         export PATH="$HOME/.local/lib/miniconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup

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
