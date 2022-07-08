if status is-interactive
    # Commands to run in interactive sessions can go here
end


function ls
    exa $argv
end

function ll
    exa -l $argv
end

function la
    exa -la $argv
end

# bass is something that allows to run bash scripts inside fish
# this function is essential inorder for nvm, node, npm to be recognised
# by the fish shell otherwise they are unkown
function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

# for nvm stuff
bass export NVM_DIR="$HOME/.nvm"
bass \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
