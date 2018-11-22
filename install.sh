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

# macOS
if [[ $(uname) == 'Darwin' ]]; then

  # Increase window resize speed for Cocoa applications.
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  # Expand save panel by default.
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Automatically quit printer app once the print jobs complete.
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Enable the Develop menu and the Web Inspector in Safari.
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  # Disable swipe navigation in Chrome.
  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

fi

if [[ $? == 0 ]]; then
  echo "Installed zsh configuration successfully."
fi
