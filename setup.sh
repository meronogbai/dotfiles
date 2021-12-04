#!/bin/sh

RELATIVE_PATH=`dirname "$0"`
ABSOLUTE_PATH=`(cd $RELATIVE_PATH && pwd)`
ln -s $ABSOLUTE_PATH/.gitconfig ~/.gitconfig
ln -s $ABSOLUTE_PATH/.gitignore_global ~/.gitignore_global
ln -s $ABSOLUTE_PATH/.p10k.zsh ~/.p10k.zsh
ln -s $ABSOLUTE_PATH/.vimrc ~/.vimrc
ln -s $ABSOLUTE_PATH/.zshrc ~/.zshrc
