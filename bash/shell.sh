shopt -s checkhash      # build a hash of the commands in PATH; look there first; in PATH after
shopt -s checkwinsize   # auto-update the value of LINES and COLUMNS
shopt -s cmdhist        # save a multiple-line command in the same history entry
shopt -s histappend     # append rather than overwrite the HISTFILE when the shell exits
shopt -s progcomp       # programmable completion

HISTSIZE=1000           # history lines in memory
HISTFILESIZE=1000       # history lines on disk
HISTCONTROL=ignoreboth  # don't save line starting with a space or dups
