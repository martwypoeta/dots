# history settings
setopt histignoredups
setopt sharehistory
setopt incappendhistory

HISTFILE=~/.zsh_history
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

# fastfetch
fastfetch

