#!/bin/sh

# Install pure-prompt if it's not installed.
# TODO:

# Copy zsh configuration file.
cp .zshrc ~/.zshrc

# Change default shell to Fish.
chsh -s /bin/zsh
