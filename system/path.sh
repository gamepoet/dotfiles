HOMEBREW_PREFIX=$(brew --prefix)

prepend-path() {
  [ -d $1] && PATH="$1:$PATH"
}

prepend-path "/bin"
prepend-path "/sbin"
prepend-path "/usr/bin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/bin"
prepend-path "${HOMEBREW_PREFIX}/bin"
prepend-path "${HOMEBREW_PREFIX}/sbin"
prepend-path "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin"
prepend-path "${DOTFILES_DIR}/bin"
prepend-path "${HOME}/.cargo/bin"

unset HOMEBREW_PREFIX

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755

PATH=$(echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')
