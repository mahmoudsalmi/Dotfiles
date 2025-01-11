#-- load config functions --#
source "$MS_ZSH_CONFIG/core/01_variables.sh"
source "$MS_ZSH_CONFIG/core/02_plugins.zsh"
source "$MS_ZSH_CONFIG/core/03_opts.zsh"
source "$MS_ZSH_CONFIG/core/04_keybindings.zsh"
source "$MS_ZSH_CONFIG/core/05_completions.zsh"
source "$MS_ZSH_CONFIG/core/06_aliases.zsh"
source "$MS_ZSH_CONFIG/core/07_startup.zsh"

ms_zsh_variables

ms_zsh_plugins_init
ms_zsh_startup_prompt

ms_zsh_setopt
ms_zsh_keybinding
ms_zsh_alias

ms_zsh_plugins_load

ms_zsh_completions
ms_zsh_plugins_load_completions
ms_zsh_plugins_load_post_completions

ms_zsh_startup_load
