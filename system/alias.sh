LS_COLORIZED=$(is-supported "ls --color=auto" --color=auto -G)

alias l="ls -AFh ${LS_COLORIZED}"
alias ll="ls -Fhl"

unset LS_COLORIZED
