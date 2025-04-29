# prompt
autoload -U colors && colors
autoload -Uz vcs_info

precmd() {
  vcs_info
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' [%b]'
zstyle ':vcs_info:git:*' actionformats ' [%b|%a]'

setopt prompt_subst

PS1='%{$fg[blue]%}[%{$fg[green]%}%n %{$fg[cyan]%}%~%{$fg[blue]%}]%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%} %# '

# autocompletions (built-in)
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' completer _complete _ignored _approximate

# autosuggestions
# % sudo pacman -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fastfetch
command -v fastfetch >/dev/null && fastfetch
echo
