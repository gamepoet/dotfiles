LS_COLORIZED=$(is-supported "ls --color=auto" --color=auto -G)

alias l="ls -aAFh ${LS_COLORIZED}"
alias ll="ls -aAFhl ${LS_COLORIZED}"

unset LS_COLORIZED

alias gitd="git diff"
alias gitdc="git diff --cached"
alias gitl="git l"
alias gits="git status -sb"

alias iso8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'