#!/bin/bash

# "Install" Antigen.
if ! [[ -f ~/.antigen.zsh ]]; then
  curl -L git.io/antigen > ~/.antigen.zsh
fi

# Copy zsh configuration file.
cp .zshrc ~/.zshrc

# Change default shell to zsh.
if [[ $(uname) == 'Linux' ]]; then
  DEFAULT_SHELL=$(awk -F: -v user=$USER '$1 == user {print $NF}' /etc/passwd)
else
  DEFAULT_SHELL=$SHELL
fi
if ! [[ $DEFAULT_SHELL == '/bin/zsh' ]]; then
  chsh -s /bin/zsh
fi

# Set macOS configuration.
if [[ $(uname) == 'Darwin' ]]; then
  ./macos.sh
fi

if [[ $? != 0 ]]; then
  zsh
fi
