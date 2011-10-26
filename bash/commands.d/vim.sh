if [ "$OS" = "linux" ]; then
  alias v=vim
else
  # assume OSX
  alias v=mvim
  alias vc=vim
  alias vt='mvim --remote-tab'
fi
