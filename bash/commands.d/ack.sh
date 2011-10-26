# Prefer ack for grepping if available
if type -P ack &> /dev/null; then
  function g() {
    ack "$*" --all-types --color-match=green --color-filename=blue --smart-case
  }
  function gw() {
    ack "$*" --all-types --color-match=green --color-filename=blue --smart-case --word-regexp
  }
  function f() {
    ack -i -g ".*$*[^\/]*$" | highlight blue ".*/" green "$*[^/]"
  }
else
  function g() {
    grep -Ri $1 *
  }
  function f() {
    find . -iname "$1"
  }
fi
