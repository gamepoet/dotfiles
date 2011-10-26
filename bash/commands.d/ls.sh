# Get ls to use colors
if [ "$OS" = "linux" ]; then
  alias ls='ls --color=auto'
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'
else
  # Assume OSX
  alias ls='ls -G'
fi

alias l='ls -F'
alias la='ls -AF'
alias ll='ls -Fl'
alias lla='ls -AFl'
