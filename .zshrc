# Use pure prompt: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# https://stackoverflow.com/questions/12382499/looking-for-altleftarrowkey-solution-in-zsh
bindkey "[C" forward-word
bindkey "[D" backward-word

# Use the antigen plugin manager: https://github.com/zsh-users/antigen
source /usr/local/share/antigen/antigen.zsh

# Add syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that we're done.
antigen apply
