# zmodload zsh/zprof
# timer=$(gdate "+%N")

if [ -f ~/.config/zsh/exports ]; then
    . ~/.config/zsh/exports
fi

if [ -f ~/.config/zsh/aliases ]; then
    . ~/.config/zsh/aliases
fi

if [ -f ~/.config/zsh/func ]; then
    . ~/.config/zsh/func
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
 PROMPT='$(current_dir)$(return_status)'

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

# now=$(gdate "+%N")
# elapsed=$(($now-$timer))
# echo $elapsed
# zprof

PATH="${PATH:+${PATH}:}$HOME/.local/bin"

