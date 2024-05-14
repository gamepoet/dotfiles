export DOTFILES_DIR=${HOME}/.dotfiles

# get a list of all the zsh files
typeset -U config_files
config_files=(${DOTFILES_DIR}/system/*.zsh)

# load all those files
for file in ${config_files}; do
  source $file
done
