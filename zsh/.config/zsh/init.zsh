# =================================== 01. Variables
source "$MS_ZSH_CONFIG/core/01_variables.sh"
[ -f "$MS_ZSH_CONFIG/custom/01_variables.zsh" ] && source "$MS_ZSH_CONFIG/custom/01_variables.zsh"
# =================================== 02. Plugins
source "$MS_ZSH_CONFIG/core/02_plugins.zsh"
[ -f "$MS_ZSH_CONFIG/custom/02_plugins.zsh" ] && source "$MS_ZSH_CONFIG/custom/02_plugins.zsh"

# =================================== 03. Options
source "$MS_ZSH_CONFIG/core/03_opts.zsh"
[ -f "$MS_ZSH_CONFIG/custom/03_opts.zsh" ] && source "$MS_ZSH_CONFIG/custom/03_opts.zsh"

# =================================== 04. keys binding
source "$MS_ZSH_CONFIG/core/04_keybindings.zsh"
[ -f "$MS_ZSH_CONFIG/custom/04_keybindings.zsh" ] && source "$MS_ZSH_CONFIG/custom/04_keybindings.zsh"

# =================================== 05. Auto-Completions
source "$MS_ZSH_CONFIG/core/05_completions.zsh"
[ -f "$MS_ZSH_CONFIG/custom/05_completions.zsh" ] && source "$MS_ZSH_CONFIG/custom/05_completions.zsh"

# =================================== 06. Aliases
source "$MS_ZSH_CONFIG/core/06_aliases.zsh"
[ -f "$MS_ZSH_CONFIG/custom/06_aliases.zsh" ] && source "$MS_ZSH_CONFIG/custom/06_aliases.zsh"

# =================================== 07. Startup
source "$MS_ZSH_CONFIG/core/07_startup.zsh"
[ -f "$MS_ZSH_CONFIG/custom/07_startup.zsh" ] && source "$MS_ZSH_CONFIG/custom/07_startup.zsh"
