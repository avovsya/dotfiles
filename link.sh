#!/usr/bin/env bash
mkdir -p ~/dotfiles_backup

mv ~/.zshrc ~/dotfiles_backup/zshrc
rm ~/.zshrc
mv ~/.tmux.conf ~/dotfiles_backup/tmux.conf
rm ~/.tmux.conf
mv ~/.gitconfig ~/dotfiles_backup/gitconfig
rm ~/.gitconfig
mv ~/.gitignore ~/dotfiles_backup/gitignore
rm ~/.gitignore

ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc