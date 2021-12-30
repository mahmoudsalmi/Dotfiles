#!/bin/sh

### Install HomeBrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

### update software
softwareupdate --all --install --force

### install xcode cli tools
sudo xcode-select --install

### install brew
brew bundle --file=./osx/Brewfile install
