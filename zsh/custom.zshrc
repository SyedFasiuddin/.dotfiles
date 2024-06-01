# Start profiling: https://stackoverflow.com/a/4351664/2103996

# Per-command profiling:
# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i> '
# exec 3>&2 2> startlog.$$
# setopt xtrace prompt_subst

# Per-function profiling:
# zmodload zsh/zprof

[ -f ~/.config/zsh/exports ] && . ~/.config/zsh/exports

# Autocompletion
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $XDG_DATA_HOME/zsh/site-functions $fpath)

# zsh history stuff
export HISTFILE=$XDG_CACHE_HOME/zsh_history
export HISTFILESIZE=$HIST_SIZE
export HISTSIZE=$HIST_SIZE
export SAVEHIST=$HIST_SIZE
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY

zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
setopt MENU_COMPLETE

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $XDG_CACHE_HOME/zcompdump) ]; then
    compinit -d $XDG_CACHE_HOME/zcompdump
else
    compinit -C -d $XDG_CACHE_HOME/zcompdump
fi
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*" auto-description "specify: %d"
zstyle ":completion:*" completer _expand _complete
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" rehash true
zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" use-compctl false
zstyle ":completion:*" verbose true
zstyle ":completion:*:kill*" command "ps -U $USER -o pid,%cpu,tty,cputime,cmd"

bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line
zle -N edit-command-line
bindkey "^v" edit-command-line
bindkey "^?" backward-delete-char

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

[ -f ~/.config/zsh/aliases ] && . ~/.config/zsh/aliases
[ -f ~/.config/zsh/prompt  ] && . ~/.config/zsh/prompt

# End profiling

# Per-command profiling:
# unsetopt xtrace
# exec 2>&3 3>&-

# Per-function profiling:
# zprof > /tmp/zsh_perf

# vim: set ft=zsh:
