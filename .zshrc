# Use pure prompt: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
bindkey '[C' forward-word
bindkey '[D' backward-word

# Use the antigen plugin manager: https://github.com/zsh-users/antigen
source /usr/local/share/antigen/antigen.zsh

# Add syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that we're done.
antigen apply

# Move files to trash instead of completely removing them.
if [ `which trash` ]; then
  alias rm=trash
fi

# Configuration for the history command.
export HISTTIMEFORMAT='%d/%m/%y %T '
export HISTCONTROL=ignoredups:erasedups

# Set programming language paths.
if [ -d ~/go ]; then
  export GOPATH=~/go
  export PATH=$GOPATH/bin:$PATH
fi

# Add NPM default bin directory to $PATH if created during installation.
if [ -d ~/.npm-global ]; then
  export PATH=~/.npm-global/bin:$PATH
fi

# Linux
if [[ $(uname) == 'Linux' ]]; then

  # Fix issue with VS Code deleting things.
  export ELECTRON_TRASH='gio'

  # Create pbcopy and pbpaste aliases if xclip is installed.
  if [ `which xclip` ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
  fi

fi
