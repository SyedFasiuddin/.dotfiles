# zmodload zsh/zprof

[ -f ~/.config/zsh/exports ] && . ~/.config/zsh/exports
# [ -f ~/.config/zsh/prompt_common.zsh ] && . ~/.config/zsh/prompt_common.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
eval "$(fnm env)"
eval "$(pyenv init -)"

# Syntax highlight and Autocompletion
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

# zsh history stuff
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=$XDG_CACHE_HOME/.zsh_history
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

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

[ -f ~/.config/zsh/aliases ] && . ~/.config/zsh/aliases
[ -f ~/.config/zsh/prompt_starship ] && . ~/.config/zsh/prompt_starship
[ -f ~/.config/zsh/.fzf.zsh ] && . ~/.config/zsh/.fzf.zsh

# zprof
