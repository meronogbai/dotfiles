#!/bin/sh

SCRIPT_PATH="$( cd -- "$(dirname "$0")" > /dev/null &&  pwd -P )" 2>&1

ln -sf "$SCRIPT_PATH"/.gitconfig ~/.gitconfig
ln -sf "$SCRIPT_PATH"/.gitignore_global ~/.gitignore_global
ln -sf "$SCRIPT_PATH"/.p10k.zsh ~/.p10k.zsh
ln -sf "$SCRIPT_PATH"/.zshrc ~/.zshrc
ln -sf "$SCRIPT_PATH"/.config/nvim ~/.config/nvim

