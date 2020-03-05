#!/usr/bin/env bash
# Brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install software
brew install the_silver_searcher
brew install tmux

brew install fzf
$(brew --prefix)/opt/fzf/install

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./link.sh
