#!/bin/sh

export MS_LOCAL="$HOME/.local"
export MS_SL="$MS_LOCAL/_suckless"
export MS_SL_REPO="$MS_SL/repo"

mkdir -p "$MS_SL_REPO"

#----------------------------------------------------- tools
git_reset() {
  git fetch
  git pull --prune --rebase
  git reset --hard
  git clean -fdx
  git submodule update --init --recursive --force
  git submodule foreach git fetch
  git submodule foreach git pull --prune --rebase
  git submodule foreach git reset --hard
  git submodule foreach git clean -fdx
}

reset_env() {
  export SL_MODULE_SRC=""
  export SL_MODULE_URL=""
  export SL_MODULE_OPTS=""
}

suckless_get_sources() {
  [ ! -d "$SL_MODULE_SRC" ] && git clone --depth=1 "$SL_MODULE_URL" "$SL_MODULE_SRC"
  cd "$SL_MODULE_SRC" || exit 1
  git_reset
}

suckless_install() {
  suckless_get_sources
  cd "$SL_MODULE_SRC" || exit 1
  make "$SL_MODULE_OPTS" && sudo make install
}

#----------------------------------------------------- mahmoudsalmi/neovim
install_neovim() {
  reset_env
  export SL_MODULE_SRC="$MS_SL_REPO/neovim"
  export SL_MODULE_URL="https://github.com/neovim/neovim"
  export SL_MODULE_OPTS="CMAKE_BUILD_TYPE=Release"

  suckless_install
}

#----------------------------------------------------- COMMANDS
install_all() {
  install_neovim
}

#----------------------------------------------------- RUN
install_all
