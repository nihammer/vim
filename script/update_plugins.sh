#!/bin/bash

AUTOLOAD_PLUGINS_PATH="pack/my-plugins/start"

# Let's update the source code of plugins
pull_source_code() {
  # Typescript-vim
  echo -e '\n\n\n########## Typescript-vim ##########\n'
  if [ -d $AUTOLOAD_PLUGINS_PATH/typescript-vim ]; then
    (cd $AUTOLOAD_PLUGINS_PATH/typescript-vim && git pull)
  else
    git clone https://github.com/leafgarland/typescript-vim.git $AUTOLOAD_PLUGINS_PATH/typescript-vim
  fi
  
  # Vim-graphql
  echo -e '\n\n\n########## Vim-graphql ##########\n'
  if [ -d $AUTOLOAD_PLUGINS_PATH/vim-graphql ]; then
    (cd $AUTOLOAD_PLUGINS_PATH/vim-graphql && git pull)
  else
    git clone https://github.com/jparise/vim-graphql.git $AUTOLOAD_PLUGINS_PATH/vim-graphql
  fi
  
  # VTL - Velocity Template Language
  echo -e '\n\n\n########## VTL ##########\n'
  if [ -d $AUTOLOAD_PLUGINS_PATH/vtl ]; then
    (cd $AUTOLOAD_PLUGINS_PATH/vtl && git pull)
  else
    git clone https://github.com/sealemar/vtl.git $AUTOLOAD_PLUGINS_PATH/vtl
  fi

  echo -e '\n\n\n########## DONE! ##########\n'
}

main() {
  # Move to the correct directory
  cd $(dirname $0)'/..'

  pull_source_code
}

main
