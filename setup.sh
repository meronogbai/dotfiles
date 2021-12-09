#!/bin/sh

SCRIPT_PATH="$( cd -- "$(dirname "$0")" &> /dev/null &&  pwd -P )"

ln -s $SCRIPT_PATH/.gitconfig ~/.gitconfig
ln -s $SCRIPT_PATH/.gitignore_global ~/.gitignore_global
ln -s $SCRIPT_PATH/.p10k.zsh ~/.p10k.zsh
ln -s $SCRIPT_PATH/.vimrc ~/.vimrc
ln -s $SCRIPT_PATH/.zshrc ~/.zshrc
