# Add Snapcraft bin directory to PATH.
if [ -d /snap/bin ]; then
  PATH=/snap/bin:$PATH
fi

# https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
if [[ $(uname) == 'Darwin' ]]; then
  bindkey '[C' forward-word
  bindkey '[D' backward-word
fi
if [[ $(uname) == 'Linux' ]]; then
  bindkey ';5C' forward-word
  bindkey ';5D' backward-word
fi

# Use the antigen plugin manager: https://github.com/zsh-users/antigen
source ~/.antigen.zsh

# Add syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Add completions: https://github.com/zsh-users/zsh-completions
antigen bundle zsh-users/zsh-completions

# Add autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Use pure prompt: https://github.com/sindresorhus/pure
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that we're done.
antigen apply

# Move files to trash instead of completely removing them.
if [[ `which trash` ]]; then
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

# Set programming language paths.
if [ -d ~/go ]; then
  GOPATH=~/go
  PATH=$GOPATH/bin:$PATH
fi

# Add NPM default bin directory to $PATH if created during installation.
if [ -d ~/.npm-global ]; then
  PATH=~/.npm-global/bin:$PATH
fi

# If deno is installed, add it to $PATH.
if [ -d ~/.deno/bin ]; then
  PATH=~/.deno/bin:$PATH
fi

# Linux
if [[ $(uname) == 'Linux' ]]; then

  # Fix issue with VS Code deleting things.
  ELECTRON_TRASH='gio'

  # Create pbcopy and pbpaste aliases if xclip is installed.
  if [ `which xclip` ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
  fi

  # Setup Linuxbrew in some way?
  # eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# Set vim as the default editor.
export EDITOR=vim
