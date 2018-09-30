#!/bin/bash

cp ~/.zshrc .zshrc

if [[ $? == 0 ]]; then
  echo "Updated zsh configuration successfully."
fi
