#!/bin/sh

mkdir -p "$HOME/.local"
mkdir -p "$HOME/.local/_suckless"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/scripts"

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"

# clean old zsh config
[ -L "$HOME/.config/zsh" ] && rm "$HOME/.config/zsh"

mkdir -p "$HOME/.config/zsh"
mkdir -p "$HOME/.config/zsh/custom"
configFile="$HOME/.config/zsh/custom/01_variablesex.zsh"
[ -f "$configFile" ] || printf "#\n# SET here custom variables\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/02_plugins.zsh"
[ -f "$configFile" ] || printf "#\n# Add here custom plugins\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/03_opts.zsh"
[ -f "$configFile" ] || printf "#\n# Set here custom zsh options\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/04_keybindings.zsh"
[ -f "$configFile" ] || printf "#\n# Set here custom keybindings\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/05_completions.zsh"
[ -f "$configFile" ] || printf "#\n# Add here custom completions\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/06_aliases.zsh"
[ -f "$configFile" ] || printf "#\n# Add here custom aliases\n#\n" > "$configFile"
configFile="$HOME/.config/zsh/custom/07_startup.zsh"
[ -f "$configFile" ] || printf "#\n# Add here custom startup\n#\n" > "$configFile"

mkdir -p "$HOME/.cache"
mkdir -p "$HOME/.cache/zsh"

# CLean btop old config
[ -L "$HOME/.config/btop" ] && rm "$HOME/.config/btop"

echo "Done"
