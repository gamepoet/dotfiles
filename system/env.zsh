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

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# highlight section titles in man pages
export LESS_TERMCAP_md="${yellow}";

setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
