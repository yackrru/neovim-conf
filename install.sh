#!/bin/bash

cd $(dirname $0)

mkdir -p /tmp/yackrru-neovim-conf

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/yackrru-neovim-conf/installer.sh
sh /tmp/yackrru-neovim-conf/installer.sh ~/.cache/dein

rm -rf /tmp/yackrru-neovim-conf

echo "=============================================="
echo "=           Finished installation!           ="
echo "=============================================="
