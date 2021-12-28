#!/bin/sh

### Install HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### update software
softwareupdate --all --install --force

### install xcode cli tools
sudo xcode-select --install

### install brew
brew bundle --file=./osx/Brewfile install
