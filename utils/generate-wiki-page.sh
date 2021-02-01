#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

get_branch() { \
  cd ~/src/prismatic
  branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
  echo $branch
}

generate_prismatic_dir() { \
  mkdir -p ~/.config/nvim/wiki/prismatic
}


branch=get_branch()
noteFilename="~/.config/nvim/wiki/prismatic/$(branch).md"
if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilename
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename

