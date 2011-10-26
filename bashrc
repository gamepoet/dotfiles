# is shell interactive?
if [[ $- =~ i ]]; then
  # commands
  for file in $HOME/.bash/commands.d/*; do
    source $file
  done

  # completion
  for file in $HOME/.bash/completion.d/*; do
    source $file
  done

  # shell
  source $HOME/.bash/shell.sh

  # prompt
  source $HOME/.bash/prompt.sh
fi
