#!/bin/sh

# Install pure-prompt if it's not installed.
# TODO:

# Copy zsh configuration file.
cp .zshrc ~/.zshrc

# Change default shell to zsh.
if ! [[ `echo $SHELL | grep zsh` ]]; then
  chsh -s /bin/zsh
fi

# Install the antigen plugin manager.
if ! [[ `brew ls --versions antigen` ]]; then
  brew install antigen
fi
