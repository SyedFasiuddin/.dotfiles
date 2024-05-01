[ -f ~/.config/zsh/exports ] && . ~/.config/zsh/exports

export PS1="\e[1;34m\W \e[0;00m"

# History stuff
export HISTFILE=$XDG_CACHE_HOME/bash_history
export HISTFILESIZE=$HIST_SIZE
export HISTSIZE=$HIST_SIZE

# some cd stuff
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd

[ -f ~/.config/zsh/aliases   ] && . ~/.config/zsh/aliases

eval "$(zoxide init bash)"
