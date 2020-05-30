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
if [[ $defaultShell != $zshPath ]]; then
  # Add zsh path to /etc/shells on macOS to make it a "standard" shell.
  if [[ $(uname) == 'Darwin' && $(cat /etc/shells | grep $zshPath) == '' ]]; then
    sudo sh -c "echo $zshPath >> /etc/shells"
  fi

  chsh -s $zshPath
fi

# Set macOS configuration.
if [[ $(uname) == 'Darwin' ]]; then
  ./macos.sh
fi

if [[ $? == 0 ]]; then
  printf "\n✅ Installed zsh configuration successfully\n\n"
fi
