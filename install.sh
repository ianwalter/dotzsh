#!/bin/bash

# "Install" Antigen.
if ! [[ -f ~/.antigen.zsh ]]; then
  curl -L git.io/antigen > ~/.antigen.zsh
fi

# Copy zsh configuration file.
cp .zshrc ~/

# Copy starship prompt configuration file.
mkdir -p ~/.config
cp starship.toml ~/.config

# Change default shell to zsh.
zshPath=$(which zsh)
if [[ $(uname) == 'Linux' ]]; then
  defaultShell=$(awk -F: -v user=$USER '$1 == user {print $NF}' /etc/passwd)
else
  defaultShell=$SHELL
fi
if [[ $defaultShell != zshPath ]]; then
  chsh -s zshPath
fi

# Set macOS configuration.
if [[ $(uname) == 'Darwin' ]]; then
  ./macos.sh
fi

if [[ $? == 0 ]]; then
  zsh
  printf "\n✅ Installed zsh configuration successfully\n\n"
fi
