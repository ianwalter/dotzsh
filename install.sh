#!/bin/sh

# Change NPM default directory if necessary to avoid permission problems.
if [[ $(npm config get prefix) == '/usr' ]]; then
  mkdir ~/.npm-global
  npm config set prefix '~/.npm-global'
fi

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

# Install trash CLI program if NPM is installed.
if [[ `which npm` ]] && ! [[ `which trash` ]]; then
  npm install -g trash-cli
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

# Linux
if [[ $(uname) == 'Linux' ]]; then

  # Install xclip.
  apt-get install -y xclip


  # Change NPM default directory if necessary to avoid permission problems.
  if [[ $(npm config get prefix) == '/usr' ]]; then
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
  fi

fi

if [[ $? == 0 ]]; then
  echo "Installed zsh configuration successfully."
fi
