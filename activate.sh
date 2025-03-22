#!/bin/bash
set -ex

cd "$(dirname $0)"

venvdir="$HOME/.nvim/python3venv"
if [ ! -d "$venvdir" ];then
  mkdir -p "$venvdir"
  python3 -m venv "$venvdir"
fi
source "$venvdir/bin/activate"
pip install --upgrade pynvim neovim-remote
