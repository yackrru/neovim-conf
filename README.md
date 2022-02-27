# Neovim conf
My personal configurations of Neovim.

## Prerequirements
- Neovim
- Deno

## Set up
Install dein.vim.
```
git clone https://github.com/yackrru/neovim-conf.git ~/.config/nvim
~/.config/nvim/install.sh
```
Start Neovim!
```
nvim
```

## Keymaps

## Plugins

### [NERDTree](https://github.com/preservim/nerdtree)
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|Ctrl-t|`:NERDTreeToggle`|Toggle NERDTree window.|
|Ctrl-w|`:NERDTree`|Open or Switch to NERDTree window.|

### [surround.vim](https://github.com/tpope/vim-surround)
>Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
The plugin provides mappings to easily delete, change and add such surroundings in pairs.

### [vim-airline](https://github.com/vim-airline/vim-airline)
If you want to display the `>` and `<` symbols in the status bar, install [Powerline](https://github.com/powerline/fonts#quick-installation) fonts.
Configure powerline/fonts on your terminal.
Finally add `let g:airline_powerline_fonts=1` to your `.config/nvim/local.vim`.
#### Custom key bindings as follows.
|Key|Command|Description|
|:---|:---|:---|
|Ctrl-p|`:bprevious`|Change buffer to previous tab.|
|Ctrl-n|`:bnext`|Change buffer to next tab.|
