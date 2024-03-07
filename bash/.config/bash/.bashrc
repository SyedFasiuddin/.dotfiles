[ -f ~/.config/zsh/exports ] && . ~/.config/zsh/exports

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init bash)"
eval "$(fnm env)"
eval "$(pyenv init -)"
eval "$(starship init bash)"

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

# export PS1="\e[0;32m\W \e[0;00m"

set -o vi # to use vi keys to move in the read line

# some cd stuff
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd

[ -f ~/.config/zsh/aliases   ] && . ~/.config/zsh/aliases
[ -f ~/.config/bash/fzf.bash ] && . ~/.config/bash/fzf.bash

