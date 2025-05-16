setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

HISTSIZE=10000
SAVEHIST=10000

# prompt
setopt PROMPT_SUBST
PROMPT='%F{blue}[%F{green}%n %F{cyan}%~%F{blue}]%f %# '

# aliases
alias cat='bat'
alias tree='tree -FC'

alias ..='cd ..'
alias ...='cd ../..'

# keybinds
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3;5~' kill-word

# fastfetch
fastfetch
