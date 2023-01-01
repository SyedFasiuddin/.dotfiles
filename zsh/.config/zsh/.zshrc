# zmodload zsh/zprof
# timer=$(gdate "+%N")

if [ -f ~/.config/zsh/exports ]; then
    . ~/.config/zsh/exports
fi

if [ -f ~/.config/zsh/aliases ]; then
    . ~/.config/zsh/aliases
fi

# nvm stuff
nvm_node(){
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

#    alias node='unalias node ; unalias npm ; nvm use default ; node $@'
#    alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'
}

# rust stuff
. "$HOME/.cargo/env"

# z directory jumper
. "$XDG_STATE_HOME/z/z.sh"


################################
#zsh common things

# https://github.com/jackharrisonsherlock/common

# Prompt symbol
PROMPT_SYMBOL="❯"

# Colors
COLORS_CURRENT_DIR=blue
COLORS_RETURN_STATUS_TRUE=magenta
COLORS_RETURN_STATUS_FALSE=yellow
COLORS_GIT_STATUS_DEFAULT=green
COLORS_GIT_STATUS_STAGED=red
COLORS_GIT_STATUS_UNSTAGED=yellow

# Left Prompt
# PROMPT='$(current_dir)$(return_status)'
PROMPT='$(current_dir)'

# Right Prompt
# RPROMPT='$(git_status)'

# Enable redrawing of prompt variables
 setopt promptsubst

# Current directory
current_dir() {
  echo -n "%F{$COLORS_CURRENT_DIR%f}%c "
  #echo -n "%{$fg[$COLORS_CURRENT_DIR]%}%c "
}

# Prompt symbol
return_status() {
  echo -n "%(?.%F{$COLORS_RETURN_STATUS_TRUE}.%F{$COLORS_RETURN_STATUS_FALSE})$PROMPT_SYMBOL%f "
}

# Git status
git_status() {
    local message=""
    local message_color="%F{$COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$COLORS_GIT_STATUS_STAGED}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$COLORS_GIT_STATUS_UNSTAGED}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}${branch}%f"
    fi

    echo -n "${message}"
}


# syntax highlight plugin for zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fuzzy search, reverse search
# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

########################################
# zsh history stuff
HISTSIZE=1000000000
HISTFILESIZE=1000000000
SAVEHIST=1000
HISTFILE=$XDG_CACHE_HOME/zsh/.zsh_history
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
setopt MENU_COMPLETE

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
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

# now=$(gdate "+%N")
# elapsed=$(($now-$timer))
# echo $elapsed
# zprof

