#!/bin/sh

# Inspiration: https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh

if [[ $(uname) != "Darwin" ]]; then
    echo "Not on macos"
    exit
fi

# Install brew if not present
which -s brew || /bin/bash -c "$(curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

# Browsers
brew install --cask brave-browser
brew install --cask firefox
brew install --cask google-chrome
brew install --cask min

# Dev stuff
brew install --cask alacritty
brew install --cask docker
brew install --cask jetbrains-toolbox
brew install --cask utm

brew install abduco
brew install bash
brew install clang-format
brew install cmake
brew install fzf
brew install gh
brew install ispell
brew install lazygit
brew install openjdk@17
brew install shkd
brew install stow
brew install texinfo
brew install tmux
brew install yabai

# Editors
brew tap d12frosted/emacs-plus
brew install emacs-plus --without-cocoa
brew install nano

# Messaging
brew install --cask discord
brew install --cask telegram
brew install --cask whatsapp
