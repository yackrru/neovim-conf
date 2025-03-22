#!/bin/bash
set -ex

cd "$(dirname $0)"

mkdir -p /tmp/yackrru-neovim-conf
curl https://raw.githubusercontent.com/Shougo/dein-installer.vim/refs/heads/main/installer.sh > /tmp/yackrru-neovim-conf/installer.sh

mkdir -p "$HOME/.cache/dein"
sh /tmp/yackrru-neovim-conf/installer.sh "$HOME/.cache/dein"

rm -rf /tmp/yackrru-neovim-conf

if [ -f "$HOME/.config/nvim/init.vim.pre-dein-vim" ]; then
  rm "$HOME/.config/nvim/init.vim.pre-dein-vim"
fi

cp "$HOME/.config/nvim/init-template.vim" "$HOME/.config/nvim/init.vim"

echo "=============================================="
echo "=           Finished installation!           ="
echo "=============================================="
