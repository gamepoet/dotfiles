# editing
export EDITOR='vim'
export VISUAL='code'

# history
export HISTSIZE=32768               # history lines in memory
export HISTFILESIZE="${HISTSIZE}";  # history lines on disk
export HISTCONTROL=ignoreboth       # don't save line strating with a space or dupes
export HISTFILE=~/.zsh_history

# enable colors
export CLICOLOR=1

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# highlight section titles in man pages
export LESS_TERMCAP_md="${yellow}";

setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
