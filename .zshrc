if [[ $(uname) == 'Darwin' ]]; then
  # https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
  bindkey '[C' forward-word
  bindkey '[D' backward-word

  # Clean up LaunchServices to remove duplicates in the “Open With” menu
  alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

  # Tell ls to use colored output.
  export CLICOLOR=1
fi
if [[ $(uname) == 'Linux' ]]; then
  # https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
  bindkey ';5C' forward-word
  bindkey ';5D' backward-word

  # Tell ls to use colored output.
  alias ls='ls --color=auto'
fi

# Use the antigen plugin manager: https://github.com/zsh-users/antigen
source ~/.antigen.zsh

# Add completions: https://github.com/zsh-users/zsh-completions
antigen bundle zsh-users/zsh-completions

# Add autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Add syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that we're done.
antigen apply

# Move files to trash instead of completely removing them.
if [[ $commands[trash] ]]; then
  alias rm=trash
fi

# File to save command history.
HISTFILE=~/.zsh_history
# How many commands are loaded into shell memory.
HISTSIZE=5000
# How many commands to save to the history file.
SAVEHIST=5000
# Append history to the history file (don't overwrite).
setopt APPEND_HISTORY
# Immediately append to the history file, not just when a terminal is killed.
setopt INC_APPEND_HISTORY
# Share history across sessions.
setopt SHARE_HISTORY
# Also save when the command started and how long it ran for.
setopt EXTENDED_HISTORY
# Don't save a history line if it's the same as the previous one.
setopt HIST_IGNORE_DUPS
# When history fills up, remove duplicate commands first.
setopt HIST_EXPIRE_DUPS_FIRST
# Remove meaningless whitespace from command history.
setopt HIST_REDUCE_BLANKS

# If go is installed, add it's bin directory to $PATH.
if [[ -d ~/go ]]; then
  GOPATH=~/go
  PATH=$GOPATH/bin:$PATH
fi

# Add NPM default bin directory to $PATH if created during installation.
if [[ -d ~/.npm-global ]]; then
  PATH=~/.npm-global/bin:$PATH
fi

# If deno is installed, add it's bin directory to $PATH.
if [[ -d ~/.deno/bin ]]; then
  PATH=~/.deno/bin:$PATH
fi

# If rust is installed, source it's environment variables file.
if [[ -f $HOME/.cargo/env ]]; then
  source $HOME/.cargo/env
fi

# Linux
if [[ $(uname) == 'Linux' ]]; then

  # Fix issue with VS Code deleting things.
  ELECTRON_TRASH='gio'

  # Create pbcopy and pbpaste aliases if xclip is installed.
  if [[ `which xclip` ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
  fi

  # Add Homebrew / Linuxbrew to path.
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# Set vim as the default editor.
export EDITOR=vim

# Use starship prompt (https://starship.rs)
eval "$(starship init zsh)"

# Magically makes GPG signing work.
# https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# Set the Datadog environment.
export DD_ENV=ian-dev

# Install iTerm2 shell integration if downloaded.
if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi
