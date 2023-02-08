if [ -f ~/.config/zsh/exports ]; then
    . ~/.config/zsh/exports
fi

if [ -f ~/.config/zsh/aliases ]; then
    . ~/.config/zsh/aliases
fi

if [ -f ~/.config/bash/.fzf.bash ]; then
    . ~/.config/bash/.fzf.bash
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init bash)"

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


export PS1="\e[0;32m\W \e[0;00m"

. "$HOME/.cargo/env"

set -o vi # to use vi keys to move in the read line

# some cd stuff
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd
