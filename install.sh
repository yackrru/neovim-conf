#!/bin/bash
set -ex

cd $(dirname $0)

mkdir -p /tmp/yackrru-neovim-conf
curl https://raw.githubusercontent.com/Shougo/dein-installer.vim/refs/heads/main/installer.sh > /tmp/yackrru-neovim-conf/installer.sh

mkdir -p ~/.cache/dein
sh /tmp/yackrru-neovim-conf/installer.sh ~/.cache/dein

rm -rf /tmp/yackrru-neovim-conf

echo "=============================================="
echo "=           Finished installation!           ="
echo "=============================================="
