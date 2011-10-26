# prepend_colon(val, var)
#   if var is valid   return val:var
#   else              return val
function prepend_colon() {
  if [ -z "$2" ]; then
    echo $1
  else
    echo $1:$2
  fi
}

# unshift_path(path)
#   adds path/sbin, path/bin to PATH
#   adds path/share/man to MANPATH
function unshift_path() {
  if [ -d $1/sbin ]; then
    export PATH=$(prepend_colon "$1/sbin" $PATH)
  fi
  if [ -d $1/bin ]; then
    export PATH=$(prepend_colon "$1/bin" $PATH)
  fi
  if [ -d $1/share/man ]; then
    export MANPATH=$(prepend_colon "$1/bin" $MANPATH)
  fi
}

# Rebuild the path and manpath from nothing
#export PATH=""
#export MANPATH=""
#unshift_path "/usr/X11"
#unshift_path ""
#unshift_path "/usr"
#unshift_path "/usr/local"
#unshift_path "/opt/local"
#unshift_path "$HOME/local"
#unshift_path "$HOME"

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
