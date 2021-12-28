---
title: "Custom [Build/Install] tiers tools"
description:
date: "2021-12-03"
author: "Mahmoud SALMI"
---

# Build/Install custom tiers tools

## Prerequisite

- Tools: `git` 
- Tree : 
	```
	mkdir -p $HOME/.local/_tiers/repo
	```

## TUI Tools

- [nnn](https://github.com/jarun/nnn#quickstart) --- (n³) is a full-featured terminal file manager.
	
    ```zsh
    export NNN_SRC=$HOME/.local/_tiers/repo/nnn
    git clone https://github.com/jarun/nnn $NNN_SRC
    cd $NNN_SRC
    make O_NERD=1 O_GITSTATUS=1 O_NAMEFIRST=1
    ```
